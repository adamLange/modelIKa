within IK;

model TestModel
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-44, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Spring spring1(c = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, v(fixed = true, start = 1))  annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixed1.flange, spring1.flange_a) annotation(
    Line(points = {{-44, -16}, {-44, -10}, {-20, -10}}, color = {0, 127, 0}));
  connect(spring1.flange_b, mass1.flange_a) annotation(
    Line(points = {{0, -10}, {20, -10}, {20, -10}, {20, -10}}, color = {0, 127, 0}));
end TestModel;