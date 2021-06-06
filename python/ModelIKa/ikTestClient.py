import socket
import json
import time

HOST = "127.0.0.1"
PORT = 8826

with socket.socket(socket.AF_INET,socket.SOCK_STREAM) as s:
  s.connect((HOST,PORT))
  for i in range(10):
      d = {"q":False,
           "tt":[1,3,4],
           "to":[0,1,0]}
      s.sendall(json.dumps(d).encode())
      data = s.recv(1024)
      print(json.loads(data.decode()))
