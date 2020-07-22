from TurningUtilities import TurningToolpathGenerator
from ModelIKa import IKClient
import OCC
import OCCUtils
from OCC.Core.TopoDS import TopoDS_Shape
from OCC.Core.BRep import BRep_Builder
from OCC.Core.BRepTools import breptools_Read

# First the inverse kinematics solver server needs to be started by
# running the modelica model. It will then wait for connection.
# Here the connection is made when the iksolver client object is created.
ik_client = IKClient("127.0.0.1",8826)


"""
## low level use of ik_client
#  Here, only for demonstration, I show how to invoke the inverse 
#  kinematics solve for just one target.

# tool tip target
I = 0.001
J = 0.001
K = 0.001

# tool target direction
U = 0.00
V = 0.00
W = 1.00

x,y,z,a,b = ik_client.solve((I,J,K,U,V,W),1e-6,False)
"""


## Load the face for the first pass that was created earlier in FreeCAD
shape = TopoDS_Shape()
builder = BRep_Builder()
breptools_Read(shape, './pass_2_surface.brep', builder)
face = OCCUtils.Topo(shape).faces().__next__()

## Higher level use of the ik_client
#  The inverse kinematics solver gets invoked may times by TurningToolpathGenerator.
ttg = TurningToolpathGenerator(face,ik_client)

ttg.ball_radius = 25.4/16
ttg.cutting_angle = 5
ttg.inside = False  # False -> cut outside
ttg.reverse_helix = True
ttg.initial_extension = 1
ttg.output_offset = [0,0,0,90,0]
ttg.create_target_vis_edges = True
ttg.makeHelixOnCyl()
ttg.generate_tool_targets()
ttg.write_target_edges("./pass_2_targets.brep")
ttg.write_gcode("./pass_2.ngc")

