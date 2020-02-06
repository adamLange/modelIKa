from OCC.Core.gp import gp_Vec
import pandas as pd

class PostProcessor:

  def __init__(self,infile):
    self.infile = infile
    self.v_tool = gp_Vec()
    self.v_orient = gp_Vec(0,0,0.500+1e-8)
    self.f = open("/tmp/bla","w")
    self.num_steps = 0

    self.df = pd.read_csv("/home/adam/projects/modelIKa/python/toolpathGeneration/sphere_path.csv")
    self.df_index = 0

  def finalize(self):
    self.f.close()

  def IK_step(self,x,y,z,a,b):
    if self.num_steps <= 10:
      self.f.write("{},{},{},{},{}\n".format(x,y,z,a,b))
      self.f.write("burrito\n")
    
    if (self.df_index + 1) <= len(self.df):
      i,xi,yi,zi,ii,ji,ki = self.df.iloc[self.df_index]
      self.v_tool = gp_Vec(xi,yi,zi)
      self.v_orient = gp_Vec(ii,ji,ki) * (0.50+1e-8)
      self.df_index += 1

    shutdownModelica = False
    self.num_steps += 1
    if self.num_steps > 10:
      self.finalize()
    return (self.v_tool.X(),self.v_tool.Y(),self.v_tool.Z(),
            self.v_orient.X(),self.v_orient.Y(),self.v_orient.Z(),
            2e-6,2e-6,shutdownModelica)
