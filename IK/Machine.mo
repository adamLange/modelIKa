within IK;

model Machine
  Modelica.Mechanics.MultiBody.Joints.Revolute b_axis(a(fixed = false), n = {0, 0, -1}, phi(fixed = true, start = 0.174533), useAxisFlange = true, w(fixed = false, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1 annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute a_axis(a(fixed = false), n = {1, 0, 0}, phi(fixed = true, start = 0), useAxisFlange = true, w(fixed = false, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic y_axis(n = {0, -1, 0}, s(fixed = true), useAxisFlange = true, v(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic x_axis(n = {-1, 0, 0},s(fixed = true), useAxisFlange = true, v(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic z_axis(n = {0, 0, 1}, s(fixed = true, start = 0), useAxisFlange = true, v(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)  annotation(
    Placement(visible = true, transformation(origin = {-66, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Spring tool_tip_spring(c = 1000000, s_small = 1e-15, s_unstretched = 1e-10)  annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Spring tool_shank_spring(c = 1000000, s_small = 1e-15, s_unstretched = 1e-10)  annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper b_damper(d = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper a_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper y_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {50, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper x_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper z_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_shank_position(r = {0, 0, 0.5})  annotation(
    Placement(visible = true, transformation(origin = {130, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_tip_position(r = {0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {130, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  IK.ToolTarget tool_target annotation(
    Placement(visible = true, transformation(origin = {-118, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  IK.ToolTarget tool_shank_target annotation(
    Placement(visible = true, transformation(origin = {-160, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.Distance distance_tool_tip annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.Distance distance_tool_shank annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  IK.ControlInterfaceUtilities.ControlInterface controlInterface1(tolerance_i = {0.0006, 0.0006},tool_tip_orientation_i = {0, 0, 0.50}, tool_tip_position_i = {0, 0, -1e6})  annotation(
    Placement(visible = true, transformation(origin = {-156, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body spindle_body(m = 0.01, r_CM = {0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {140, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 0.01, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body2(m = 0.01, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body3(m = 0.01, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.Body body4(m = 0.1, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor y_position_sensor annotation(
    Placement(visible = true, transformation(origin = {62, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor x_position_sensor annotation(
    Placement(visible = true, transformation(origin = {104, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor z_position_sensor annotation(
    Placement(visible = true, transformation(origin = {144, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor b_angle_sensor annotation(
    Placement(visible = true, transformation(origin = {-94, -104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor a_angle_sensor annotation(
    Placement(visible = true, transformation(origin = {-14, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  IK.Limiter limiter1(k = 10, lower_limit = -115 * Modelica.Constants.pi / 180, upper_limit = 45 * Modelica.Constants.pi / 180)  annotation(
    Placement(visible = true, transformation(origin = {-10, -156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {38, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Limiter b_limiter(k = 10, lower_limit = 0, upper_limit = 360 * Modelica.Constants.pi / 180)  annotation(
    Placement(visible = true, transformation(origin = {-128, -154}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_b_limiter annotation(
    Placement(visible = true, transformation(origin = {-84, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(b_axis.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{-60, -50}, {-40, -50}, {-40, -50}, {-40, -50}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, a_axis.frame_a) annotation(
    Line(points = {{-20, -50}, {2.98024e-7, -50}, {2.98024e-7, -50}, {2.98024e-7, -50}}, color = {95, 95, 95}));
  connect(a_axis.frame_b, y_axis.frame_a) annotation(
    Line(points = {{20, -50}, {40, -50}}, color = {95, 95, 95}));
  connect(y_axis.frame_b, x_axis.frame_a) annotation(
    Line(points = {{60, -50}, {70, -50}, {70, -36}, {50, -36}, {50, -20}, {58, -20}, {58, -20}, {60, -20}}, color = {95, 95, 95}));
  connect(x_axis.frame_b, z_axis.frame_a) annotation(
    Line(points = {{80, -20}, {90, -20}, {90, 16}, {46, 16}, {46, 32}, {60, 32}}));
  connect(world.frame_b, b_axis.frame_a) annotation(
    Line(points = {{-56, -4}, {-38, -4}, {-38, -32}, {-88, -32}, {-88, -50}, {-80, -50}, {-80, -50}}, color = {95, 95, 95}));
  connect(b_damper.flange_a, b_axis.support) annotation(
    Line(points = {{-80, -74}, {-90, -74}, {-90, -38}, {-76, -38}, {-76, -40}, {-76, -40}}));
  connect(b_axis.axis, b_damper.flange_b) annotation(
    Line(points = {{-70, -40}, {-70, -40}, {-70, -38}, {-52, -38}, {-52, -74}, {-60, -74}, {-60, -74}}));
  connect(a_damper.flange_a, a_axis.support) annotation(
    Line(points = {{0, -20}, {-8, -20}, {-8, -40}, {4, -40}, {4, -40}}));
  connect(a_axis.axis, a_damper.flange_b) annotation(
    Line(points = {{10, -40}, {26, -40}, {26, -20}, {20, -20}, {20, -20}}));
  connect(y_damper.flange_a, y_axis.support) annotation(
    Line(points = {{40, -72}, {28, -72}, {28, -42}, {46, -42}, {46, -44}, {46, -44}}, color = {0, 127, 0}));
  connect(y_damper.flange_b, y_axis.axis) annotation(
    Line(points = {{60, -72}, {66, -72}, {66, -40}, {58, -40}, {58, -44}, {58, -44}}, color = {0, 127, 0}));
  connect(x_damper.flange_a, x_axis.support) annotation(
    Line(points = {{60, 2}, {48, 2}, {48, -12}, {66, -12}, {66, -14}, {66, -14}}, color = {0, 127, 0}));
  connect(x_axis.axis, x_damper.flange_b) annotation(
    Line(points = {{78, -14}, {78, -14}, {78, -10}, {86, -10}, {86, 2}, {80, 2}, {80, 2}}, color = {0, 127, 0}));
  connect(z_damper.flange_a, z_axis.support) annotation(
    Line(points = {{60, 56}, {48, 56}, {48, 42}, {66, 42}, {66, 38}, {66, 38}}, color = {0, 127, 0}));
  connect(z_axis.axis, z_damper.flange_b) annotation(
    Line(points = {{78, 38}, {78, 38}, {78, 42}, {90, 42}, {90, 56}, {80, 56}, {80, 56}}, color = {0, 127, 0}));
  connect(tool_target.frame_a, b_axis.frame_a) annotation(
    Line(points = {{-108, -56}, {-102, -56}, {-102, -50}, {-80, -50}, {-80, -50}}));
  connect(tool_shank_target.frame_a, tool_target.frame_b) annotation(
    Line(points = {{-150, -56}, {-128, -56}}));
  connect(tool_shank_spring.frame_a, tool_shank_target.frame_b) annotation(
    Line(points = {{-20, 30}, {-198, 30}, {-198, -56}, {-170, -56}}, color = {95, 95, 95}));
  connect(tool_target.frame_b, tool_tip_spring.frame_a) annotation(
    Line(points = {{-128, -56}, {-140, -56}, {-140, 90}, {-20, 90}}));
  connect(distance_tool_tip.frame_a, tool_tip_spring.frame_a) annotation(
    Line(points = {{-20, 70}, {-28, 70}, {-28, 90}, {-20, 90}, {-20, 90}}, color = {95, 95, 95}));
  connect(distance_tool_tip.frame_b, tool_tip_spring.frame_b) annotation(
    Line(points = {{0, 70}, {10, 70}, {10, 90}, {0, 90}, {0, 90}}, color = {95, 95, 95}));
  connect(distance_tool_shank.frame_a, tool_shank_spring.frame_a) annotation(
    Line(points = {{-20, 10}, {-30, 10}, {-30, 30}, {-20, 30}, {-20, 30}}, color = {95, 95, 95}));
  connect(tool_shank_spring.frame_b, distance_tool_shank.frame_b) annotation(
    Line(points = {{0, 30}, {14, 30}, {14, 10}, {0, 10}, {0, 10}}, color = {95, 95, 95}));
  connect(controlInterface1.tool_tip_position, tool_target.vector_in) annotation(
    Line(points = {{-146, -8}, {-98, -8}, {-98, -42}, {-98, -42}, {-98, -44}, {-108, -44}, {-108, -44}}, color = {0, 0, 127}, thickness = 0.5));
  connect(controlInterface1.tool_orientation, tool_shank_target.vector_in) annotation(
    Line(points = {{-146, -12}, {-136, -12}, {-136, -44}, {-150, -44}}, color = {0, 0, 127}, thickness = 0.5));
  connect(distance_tool_tip.distance, controlInterface1.error[1]) annotation(
    Line(points = {{-10, 60}, {-10, 60}, {-10, 50}, {-178, 50}, {-178, -10}, {-164, -10}, {-164, -10}}, color = {0, 0, 127}));
  connect(distance_tool_shank.distance, controlInterface1.error[2]) annotation(
    Line(points = {{-10, 0}, {-10, 0}, {-10, -6}, {-30, -6}, {-30, 4}, {-46, 4}, {-46, 22}, {-176, 22}, {-176, -10}, {-164, -10}, {-164, -10}}, color = {0, 0, 127}));
  connect(z_axis.frame_b, spindle_body.frame_a) annotation(
    Line(points = {{80, 32}, {94, 32}, {94, 8}, {130, 8}}));
  connect(body1.frame_a, x_axis.frame_b) annotation(
    Line(points = {{130, -20}, {80, -20}, {80, -20}, {80, -20}}));
  connect(body2.frame_a, y_axis.frame_b) annotation(
    Line(points = {{130, -50}, {62, -50}, {62, -50}, {60, -50}}));
  connect(a_axis.frame_b, body3.frame_a) annotation(
    Line(points = {{20, -50}, {26, -50}, {26, -82}, {30, -82}, {30, -100}, {30, -100}}));
  connect(b_axis.frame_b, body4.frame_a) annotation(
    Line(points = {{-60, -50}, {-50, -50}, {-50, -100}, {-50, -100}}, color = {95, 95, 95}));
  connect(z_axis.frame_b, tool_tip_position.frame_a) annotation(
    Line(points = {{80, 32}, {102, 32}, {102, 38}, {120, 38}, {120, 38}}));
  connect(tool_tip_position.frame_b, tool_tip_spring.frame_b) annotation(
    Line(points = {{140, 38}, {188, 38}, {188, 118}, {20, 118}, {20, 98}, {20, 98}, {20, 90}, {0, 90}, {0, 90}}, color = {95, 95, 95}));
  connect(z_axis.frame_b, tool_shank_position.frame_a) annotation(
    Line(points = {{80, 32}, {102, 32}, {102, 66}, {120, 66}, {120, 66}}));
  connect(tool_shank_position.frame_b, tool_shank_spring.frame_b) annotation(
    Line(points = {{140, 66}, {152, 66}, {152, 92}, {30, 92}, {30, 30}, {0, 30}, {0, 30}}));
  connect(y_axis.axis, y_position_sensor.flange) annotation(
    Line(points = {{58, -44}, {66, -44}, {66, -88}, {42, -88}, {42, -98}, {52, -98}, {52, -98}}, color = {0, 127, 0}));
  connect(x_position_sensor.flange, x_axis.axis) annotation(
    Line(points = {{94, -76}, {88, -76}, {88, -10}, {78, -10}, {78, -14}, {78, -14}}, color = {0, 127, 0}));
  connect(z_axis.axis, z_position_sensor.flange) annotation(
    Line(points = {{78, 38}, {78, 38}, {78, 42}, {96, 42}, {96, -64}, {124, -64}, {124, -96}, {134, -96}, {134, -96}}, color = {0, 127, 0}));
  connect(b_damper.flange_b, b_angle_sensor.flange) annotation(
    Line(points = {{-60, -74}, {-52, -74}, {-52, -88}, {-114, -88}, {-114, -104}, {-104, -104}, {-104, -104}}));
  connect(a_axis.axis, a_angle_sensor.flange) annotation(
    Line(points = {{10, -40}, {10, -40}, {10, -40}, {26, -40}, {26, -12}, {-12, -12}, {-12, -84}, {-32, -84}, {-32, -98}, {-24, -98}, {-24, -98}}));
  connect(x_position_sensor.s, controlInterface1.machine_position[1]) annotation(
    Line(points = {{116, -76}, {118, -76}, {118, -130}, {-194, -130}, {-194, -16}, {-164, -16}, {-164, -16}}, color = {0, 0, 127}));
  connect(y_position_sensor.s, controlInterface1.machine_position[2]) annotation(
    Line(points = {{74, -98}, {76, -98}, {76, -122}, {76, -122}, {76, -130}, {-194, -130}, {-194, -16}, {-164, -16}, {-164, -16}}, color = {0, 0, 127}));
  connect(z_position_sensor.s, controlInterface1.machine_position[3]) annotation(
    Line(points = {{156, -96}, {166, -96}, {166, -124}, {166, -124}, {166, -130}, {-194, -130}, {-194, -16}, {-164, -16}, {-164, -16}}, color = {0, 0, 127}));
  connect(a_angle_sensor.phi, controlInterface1.machine_position[4]) annotation(
    Line(points = {{-2, -98}, {6, -98}, {6, -130}, {-194, -130}, {-194, -16}, {-164, -16}, {-164, -16}}, color = {0, 0, 127}));
  connect(b_angle_sensor.phi, controlInterface1.machine_position[5]) annotation(
    Line(points = {{-82, -104}, {-74, -104}, {-74, -130}, {-194, -130}, {-194, -16}, {-164, -16}, {-164, -16}}, color = {0, 0, 127}));
  connect(a_angle_sensor.phi, limiter1.u) annotation(
    Line(points = {{-2, -98}, {6, -98}, {6, -140}, {-36, -140}, {-36, -156}, {-20, -156}, {-20, -156}}, color = {0, 0, 127}));
  connect(limiter1.y, torque1.tau) annotation(
    Line(points = {{0, -156}, {12, -156}, {12, -158}, {26, -158}, {26, -158}}, color = {0, 0, 127}));
  connect(torque1.support, a_axis.support) annotation(
    Line(points = {{38, -168}, {38, -168}, {38, -176}, {58, -176}, {58, -146}, {10, -146}, {10, -82}, {-6, -82}, {-6, -40}, {4, -40}, {4, -40}}));
  connect(torque1.flange, a_axis.axis) annotation(
    Line(points = {{48, -158}, {62, -158}, {62, -142}, {14, -142}, {14, -62}, {22, -62}, {22, -40}, {10, -40}, {10, -40}}));
  connect(b_limiter.y, torque_b_limiter.tau) annotation(
    Line(points = {{-118, -154}, {-108, -154}, {-108, -158}, {-96, -158}, {-96, -158}}, color = {0, 0, 127}));
  connect(b_angle_sensor.phi, b_limiter.u) annotation(
    Line(points = {{-82, -104}, {-74, -104}, {-74, -118}, {-152, -118}, {-152, -154}, {-138, -154}, {-138, -154}}, color = {0, 0, 127}));
  connect(torque_b_limiter.flange, b_angle_sensor.flange) annotation(
    Line(points = {{-74, -158}, {-68, -158}, {-68, -138}, {-126, -138}, {-126, -104}, {-104, -104}, {-104, -104}}));
  connect(torque_b_limiter.support, b_axis.support) annotation(
    Line(points = {{-84, -168}, {-64, -168}, {-64, -134}, {-130, -134}, {-130, -82}, {-92, -82}, {-92, -36}, {-76, -36}, {-76, -40}, {-76, -40}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})));end Machine;