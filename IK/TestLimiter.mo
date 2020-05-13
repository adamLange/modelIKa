within IK;

model TestLimiter
  Limiter limiter1(k = 1 / 10, lower_limit = -10, upper_limit = 10)  annotation(
    Placement(visible = true, transformation(origin = {-8, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 100, offset = -50)  annotation(
    Placement(visible = true, transformation(origin = {-72, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, limiter1.u) annotation(
    Line(points = {{-60, 14}, {-40, 14}, {-40, 12}, {-18, 12}, {-18, 12}}, color = {0, 0, 127}));
end TestLimiter;