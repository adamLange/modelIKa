import ModelIKa

pp = ModelIKa.PostProcessor("filenombre")

for i in range(10000):
  pp.IK_step(0,0,0,0,0)
