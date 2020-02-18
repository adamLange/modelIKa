from TurningUtilities import TurningToolpathGenerator
import OCC
import OCCUtils
from OCC.Core.TopoDS import TopoDS_Shape
from OCC.Core.BRep import BRep_Builder
from OCC.Core.BRepTools import breptools_Read
import ModelIKa
from ModelIKa import IKClient

shape = TopoDS_Shape()
builder = BRep_Builder()
breptools_Read(shape, './face_pass_4.brep', builder)

face = OCCUtils.Topo(shape).faces().__next__()

iksolver = IKClient("127.0.0.1",8823)

ttg = TurningToolpathGenerator(face,iksolver)
#ttg.pitch = 1.0
ttg.v_initial_extension = 0 
ttg.cutting_angle = 5
ttg.create_target_vis_edges = True
ttg.makeHelixOnCyl()
ttg.generate_tool_targets()
ttg.write_target_edges("./pass_4_targets.brep")
ttg.write_gcode("./pass_4.ngc")
