import json
import socket

class IKClient:

  def __init__(self,host="124.0.0.1",port=8826):
    self.socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    self.socket.connect((host,port))


  def __del__(self):
    self.socket.close()

  def solve(self,pose,tollerance=1e-6,shutdown=False):
    d = {"q":shutdown,
         "pose":pose,
         "tol":tollerance}
    self.socket.sendall(json.dumps(d).encode())
    data = self.socket.recv(1024)
    d = json.loads(data.decode())
    return d["solution"]
