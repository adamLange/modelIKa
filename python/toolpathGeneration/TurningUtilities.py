from math import pi,sin,atan,radians
import OCC
from OCC.Core.BRepAdaptor import BRepAdaptor_Surface
from OCC.Core.gp import gp_Lin2d, gp_Pnt2d, gp_Dir2d,gp_Vec, gp_Trsf,gp_Pnt,gp_Dir,gp_Ax1
from OCC.Core.GCE2d import GCE2d_MakeSegment
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeEdge
from OCC.Core.Geom import Geom_CylindricalSurface
from OCC.Core.BRepAdaptor import BRepAdaptor_Curve
from OCC.Core.TopoDS import TopoDS_Compound
from OCC.Core.BRep import BRep_Builder
from OCC.Core.BRepTools import breptools_Write

class TurningToolpathGenerator:

  def __init__(self,cylindricalFace,ikSolver):
    self.face = cylindricalFace
    self.ball_radius = 25.4/32
    self.pitch = self.ball_radius/5
    self.v_initial_extension = 0
    self.v_final_extension = 0

    self.cutting_angle = 10 #deg

    self.ikSolver = ikSolver

    self.create_target_vis_edges = False
    self.target_edges = []

    self.feedrate = 100.0 # mm / min
    self.v_previous_contact_point = None

    self.gcode = "(add tool offset moves from home ect...)\n"

    self.gcode += "G21 G90 G93\n"

  def makeHelixOnCyl(self):
    bas = BRepAdaptor_Surface(self.face)
    cyl = bas.Cylinder()

    delta_v = bas.LastVParameter() - bas.FirstVParameter()
    v_final = bas.LastVParameter()

    dv_du = self.pitch / (2*pi)
    l = delta_v / sin(atan(dv_du))

    aLine2d = gp_Lin2d(gp_Pnt2d(0.0,bas.FirstVParameter()), gp_Dir2d(1,dv_du))
    aSegment = GCE2d_MakeSegment(aLine2d, 0.0, l)

    helix_edge = BRepBuilderAPI_MakeEdge(aSegment.Value(), Geom_CylindricalSurface(cyl)).Edge()

    #self.aLine2d = aLine2d
    #self.aSegment = aSegment
    self.helix_edge = helix_edge
    return helix_edge

  def generate_tool_targets(self):
    ba = BRepAdaptor_Curve(self.helix_edge)
    u_min = ba.FirstParameter()
    u_max = ba.LastParameter()
    u_step = 0.1
    u_now = u_min
    while u_now <= u_max:
      v_contact = gp_Vec(ba.Value(u_now).XYZ())
      v_contact_to_ball_center =  -gp_Vec(v_contact.X(),v_contact.Y(),0).Normalized()*self.ball_radius
      trsf = gp_Trsf()
      trsf.SetRotation(gp_Ax1(gp_Pnt(0,0,0),gp_Dir(0,0,1)),pi/2)
      v_rotation_axis = v_contact_to_ball_center.Transformed(trsf)
      trsf.SetRotation(gp_Ax1(gp_Pnt(0,0,0),gp_Dir(v_rotation_axis.XYZ())),radians(self.cutting_angle))
      v_ball_center_to_tool_tip = gp_Vec(0,0,-self.ball_radius)
      v_ball_center_to_tool_tip.Transform(trsf)
      v_tool_tip = v_contact+v_contact_to_ball_center+v_ball_center_to_tool_tip
      v_tool_orientation = - v_ball_center_to_tool_tip.Normalized() * (0.500+1e-8)

      if self.create_target_vis_edges:
        me = BRepBuilderAPI_MakeEdge(gp_Pnt(v_tool_tip.XYZ()),gp_Pnt((v_tool_tip+v_tool_orientation).XYZ()))
        self.target_edges.append(me.Edge())

      I = v_tool_tip.X() / 1000
      J = v_tool_tip.Y() / 1000
      K = v_tool_tip.Z() / 1000

      U = v_tool_orientation.X()
      V = v_tool_orientation.Y()
      W = v_tool_orientation.Z()


      x,y,z,a,b = self.ikSolver.solve((I,J,K,U,V,W),1e-6,False)

      if self.v_previous_contact_point:
        cut_distance = (v_contact - self.v_previous_contact_point).Magnitude()
        f = self.feedrate / cut_distance
      else:
        f = 0
      self.v_previous_contact_point = v_contact

      self.gcode += "G01 X{:.6f} Y{:.6f} Z{:.6f} A{:.6f} B{:.6f} F{:.6f}\n".format(x,y,z,a,b,f)
      print(x,y,z,a,b)

      if u_now == u_max:
        break
      u_next = u_now + u_step
      if u_next > u_max:
        u_next = u_max
      u_now = u_next

  def write_target_edges(self,filename):
    comp = TopoDS_Compound()
    builder = BRep_Builder()
    builder.MakeCompound(comp)
    for shape in self.target_edges:
      builder.Add(comp, shape)
    breptools_Write(comp,filename)

  def write_gcode(self,filename):
    self.gcode += "(add spindle stuff and return to home)\n"
    self.gcode += "M2"
    f = open(filename,"w")
    f.write(self.gcode)
    f.close()

