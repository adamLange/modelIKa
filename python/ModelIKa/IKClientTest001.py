import ModelIKa

client = ModelIKa.IKClient("127.0.0.1",8826)

for i in range(10):
  client.solve([1,3,2],False)

del client
