from OCC.Core.gp import gp_Vec
import pandas as pd
import socket
import json
from math import degrees

from ModelIKa.IKClient import IKClient

class PostProcessor:

  def __init__(self,infile):
    #self.infile = infile
    self.v_tool = gp_Vec()
    self.v_orient = gp_Vec(0,0,0.500+1e-8)

    #self.f = open("/tmp/bla","w")
    #self.num_steps = 0

    #self.df = pd.read_csv("/home/adam/projects/modelIKa/python/toolpathGeneration/sphere_path.csv")
    #self.df_index = 0

    self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    HOST = "127.0.0.1"
    PORT = 8826
    self.sock.bind((HOST,PORT))
    self.sock.listen()
    self.conn = None

    self.request = self.getRequest() # burn one request for initialization
    self.primed = False

  def finalize(self):
    if self.conn:
      self.conn.close()
      self.conn = None
    self.sock.close()
    self.f.close()

  def getRequest(self):

    data_in = ""
    while len(data_in) == 0:

      if (not self.conn) :
        self.conn,conInfo = self.sock.accept()

      data_in = self.conn.recv(1024)
      if len(data_in) == 0:
        print("dang!")
        self.conn.close()
        self.conn = None

    d = json.loads(data_in.decode())
    return d

  def IK_step(self,x,y,z,a,b):

    if self.primed:
      data_out = {"solution":(x/1e3,y*1e3,z*1e3,degrees(a),degrees(b))}
      self.conn.sendall(json.dumps(data_out).encode())
      self.request = self.getRequest()
    else:
      self.primed = True
    
    tol = self.request["tol"]
    shutdownModelica = self.request["q"]
    if self.request["q"]:
      self.finalize()
    pose = self.request["pose"]

    return (*pose,tol,tol,shutdownModelica)
