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
breptools_Read(shape, './innerFace.brep', builder)

face = OCCUtils.Topo(shape).faces().__next__()

iksolver = IKClient("127.0.0.1",8823)

ttg = TurningToolpathGenerator(face,iksolver)
ttg.v_initial_extension = 1.3
ttg.cutting_angle = 90
ttg.makeHelixOnCyl()
ttg.generate_tool_targets()
