within IK;

model Limiter
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-96, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {96, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real k;
  parameter Real lower_limit;
  parameter Real upper_limit;
equation
  if u > upper_limit then
    y = -(10^(k*(u - upper_limit)) - 1);
  elseif u < lower_limit then
    y = (10^(k*(lower_limit - u)) - 1);
  else
    y = 0;
  end if;
annotation(
    Icon(graphics = {Text(origin = {2, 0}, extent = {{-34, 30}, {34, -30}}, textString = "limiter")}));end Limiter;