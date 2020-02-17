from OCC.Core.gp import gp_Vec
import pandas as pd
import socket
import json

from ModelIKa.IKClient import IKClient

class PostProcessor:

  def __init__(self,infile):
    #self.infile = infile
    self.v_tool = gp_Vec()
    self.v_orient = gp_Vec(0,0,0.500+1e-8)
    #self.f = open("/tmp/bla","w")
    #self.num_steps = 0

    self.df = pd.read_csv("/home/adam/projects/modelIKa/python/toolpathGeneration/sphere_path.csv")
    self.df_index = 0

    self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    HOST = "127.0.0.1"
    PORT = 8823
    self.sock.bind((HOST,PORT))
    self.sock.listen()
    self.conn = None

  def finalize(self):
    if self.conn:
      self.conn.close()
      self.conn = None
    self.sock.close()
    self.f.close()

  def IK_step(self,x,y,z,a,b):

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
    print(d)
    data_out = {"green":"red"}
    self.conn.sendall(json.dumps(data_out).encode())
    
    """
    if self.num_steps <= 10:
      self.f.write("{},{},{},{},{}\n".format(x,y,z,a,b))
      self.f.write("burrito\n")
    
    if (self.df_index + 1) <= len(self.df):
      i,xi,yi,zi,ii,ji,ki = self.df.iloc[self.df_index]
      self.v_tool = gp_Vec(xi,yi,zi)
      self.v_orient = gp_Vec(ii,ji,ki) * (0.50+1e-8)
      self.df_index += 1
    """

    #self.num_steps += 1
    shutdownModelica = d["q"]
    if d["q"]:
      self.finalize()
    pose = d["pose"]
    return (*pose,
            2e-6,2e-6,shutdownModelica)
