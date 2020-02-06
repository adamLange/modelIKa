import OCC

from OCC.Core.gp import *
from OCC.Core.BRepBuilderAPI import *
from OCC.Core.BRep import BRep_Tool

import numpy as np
from math import pi
import pandas as pd

sp = gp_Sphere()
sp.SetRadius(0.010)
mf = BRepBuilderAPI_MakeFace(sp)
face = mf.Face()
surf = BRep_Tool.Surface(face)
u = np.linspace(pi/10,pi/2,10)
v = np.linspace(pi/10,pi/2,10)
edges = []
x_out = []
y_out = []
z_out = []
i_out = []
j_out = []
k_out = []
for u_i in u:
  for v_i in v:
    pnt = gp_Pnt()
    d1u = gp_Vec()
    d1v = gp_Vec()
    surf.D1(u_i,v_i,pnt,d1u,d1v)
    v_norm = d1u.Crossed(d1v).Normalized()
    p0 = surf.Value(u_i,v_i) # point on surface
    v0 = gp_Vec(p0.XYZ()) # vector on surface
    v1 = v0 + v_norm
    p1 = gp_Pnt(v1.XYZ())
    me = BRepBuilderAPI_MakeEdge(p0,p1)
    edges.append(me.Edge())
    x_out.append(v0.X())
    y_out.append(v0.Y())
    z_out.append(v0.Z())
    i_out.append(v_norm.X())
    j_out.append(v_norm.Y())
    k_out.append(v_norm.Z())

df = pd.DataFrame({"x":x_out,"y":y_out,"z":z_out,
                   "i":i_out,"j":j_out,"k":k_out})
df.to_csv("/home/adam/projects/modelIKa/python/toolpathGeneration/sphere_path.csv")
