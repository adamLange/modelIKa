import ModelIKa
import numpy as np
from math import radians

from OCC.Core.gp import *

client = ModelIKa.IKClient('127.0.0.1',8826)

def solve(v_tip,v_orientation):
    """
    Makes a call to a running modelIKa server to solve
    for a desired machine pose.
    Returns the machine joint positions in mm and degrees.

    The first argument is a gp_Vec describing the target tool tip
    position in mm.

    The second argument is a gp_Vec from the tip to somewhere on the shank
    of the tool.  The amplitude is not critical as it is normalized and scaled
    to match the construction of the model in modelica.

   
    """
    v_tip_meters = v_tip * 1e-3

    # It's assumed that the tool tip target and tool shank target in
    # the modelica model are 0.5 meters apart in the modelica model.
    # The +1e-8 keeps the springs from going to zero length which would
    # crash the simulation.
    v_shank_tip = v_orientation.Normalized() * (0.500+1e-8)

    tup_tip = (v_tip_meters.X(), v_tip_meters.Y(), v_tip_meters.Z())
    tup_shank_tip = v_shank_tip.X(),v_shank_tip.Y(),v_shank_tip.Z()
    x,y,z,a,b = client.solve((*tup_tip,*tup_shank_tip),1e-6,False)
    return x,y,z,a,b

# feeding the solver a random pose
coords = solve(gp_Vec(1.2,10,0.198),gp_Vec(6.288,0,3.631))

# printing out a gcode line that would move the machine to that pose
print("G0 X{:.3f} Y{:.3f} Z{:.3f} A{:.3f} B{:.3f}".format(*coords))
