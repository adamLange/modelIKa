within IK;

model ToolTarget
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic_x(useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic_y(n = {0, 1, 0}, useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic_z(n = {0, 0, 1}, useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position x_position annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position y_position annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position z_position annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vector_in[3] annotation(
    Placement(visible = true, transformation(origin = {-92, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(frame_a, prismatic_x.frame_a) annotation(
    Line(points = {{-100, 0}, {-60, 0}, {-60, 0}, {-60, 0}}));
  connect(prismatic_x.frame_b, prismatic_y.frame_a) annotation(
    Line(points = {{-40, 0}, {-12, 0}, {-12, 0}, {-10, 0}}, color = {95, 95, 95}));
  connect(prismatic_y.frame_b, prismatic_z.frame_a) annotation(
    Line(points = {{10, 0}, {40, 0}, {40, 0}, {40, 0}}, color = {95, 95, 95}));
  connect(prismatic_z.frame_b, frame_b) annotation(
    Line(points = {{60, 0}, {100, 0}, {100, 0}, {100, 0}}, color = {95, 95, 95}));
  connect(prismatic_x.support, x_position.support) annotation(
    Line(points = {{-54, 6}, {-54, 6}, {-54, 12}, {-50, 12}, {-50, 20}, {-50, 20}}, color = {0, 127, 0}));
  connect(prismatic_x.axis, x_position.flange) annotation(
    Line(points = {{-42, 6}, {-42, 6}, {-42, 12}, {-34, 12}, {-34, 30}, {-40, 30}, {-40, 30}}, color = {0, 127, 0}));
  connect(prismatic_y.support, y_position.support) annotation(
    Line(points = {{-4, 6}, {-4, 6}, {-4, 10}, {0, 10}, {0, 20}, {0, 20}}, color = {0, 127, 0}));
  connect(prismatic_y.axis, y_position.flange) annotation(
    Line(points = {{8, 6}, {8, 6}, {8, 10}, {16, 10}, {16, 30}, {10, 30}, {10, 30}}, color = {0, 127, 0}));
  connect(prismatic_z.support, z_position.support) annotation(
    Line(points = {{46, 6}, {46, 6}, {46, 12}, {50, 12}, {50, 20}, {50, 20}}, color = {0, 127, 0}));
  connect(prismatic_z.axis, z_position.flange) annotation(
    Line(points = {{58, 6}, {58, 6}, {58, 12}, {66, 12}, {66, 30}, {60, 30}, {60, 30}}, color = {0, 127, 0}));
  connect(vector_in[1], x_position.s_ref) annotation(
    Line(points = {{-92, 70}, {-52, 70}, {-52, 48}, {-76, 48}, {-76, 30}, {-62, 30}, {-62, 30}}, color = {0, 0, 127}));
  connect(vector_in[2], y_position.s_ref) annotation(
    Line(points = {{-92, 70}, {-28, 70}, {-28, 36}, {-28, 36}, {-28, 30}, {-12, 30}, {-12, 30}}, color = {0, 0, 127}));
  connect(vector_in[3], z_position.s_ref) annotation(
    Line(points = {{-92, 70}, {30, 70}, {30, 30}, {36, 30}, {36, 30}, {38, 30}}, color = {0, 0, 127}));
end ToolTarget;
