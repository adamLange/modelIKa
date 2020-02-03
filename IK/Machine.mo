within IK;

model Machine
  Modelica.Mechanics.MultiBody.Joints.Revolute b_axis(a(fixed = false), phi(fixed = true), useAxisFlange = true, w(fixed = false, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1 annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute a_axis(a(fixed = false), n = {1, 0, 0}, phi(fixed = true), useAxisFlange = true, w(fixed = false, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic y_axis(n = {0, 1, 0}, s(fixed = true), useAxisFlange = true, v(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic x_axis(s(fixed = true), useAxisFlange = true, v(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic z_axis(n = {0, 0, 1}, s(fixed = true), useAxisFlange = true, v(fixed = false))  annotation(
    Placement(visible = true, transformation(origin = {70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)  annotation(
    Placement(visible = true, transformation(origin = {-66, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Spring tool_tip_spring(c = 1000000)  annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Spring tool_shank_spring(c = 1000000)  annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper b_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {-70, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper a_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper y_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {50, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper x_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper z_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_shank_position(r = {0, 0, 0.50})  annotation(
    Placement(visible = true, transformation(origin = {110, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_tip_position(r = {0, 0, -0.500})  annotation(
    Placement(visible = true, transformation(origin = {150, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  IK.ToolTarget tool_target annotation(
    Placement(visible = true, transformation(origin = {-118, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  IK.ToolTarget tool_shank_target annotation(
    Placement(visible = true, transformation(origin = {-162, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.Distance distance_tool_tip annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.Distance distance_tool_shank annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  IK.ControlInterfaceUtilities.ControlInterface controlInterface1(tolerance_i = {0.0006, 0.0006},tool_tip_orientation_i = {0, 0, 0.50}, tool_tip_position_i = {0.001, 0, -1e-6})  annotation(
    Placement(visible = true, transformation(origin = {-156, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body spindle_body(m = 0.1, r_CM = {0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {140, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 0.1, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body2(m = 0.1, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body3(m = 0.1, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.Body body4(m = 0.1, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
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
  connect(z_axis.frame_b, tool_shank_position.frame_a) annotation(
    Line(points = {{80, 32}, {100, 32}, {100, 32}, {100, 32}}));
  connect(tool_shank_position.frame_b, tool_tip_position.frame_a) annotation(
    Line(points = {{120, 32}, {138, 32}, {138, 32}, {140, 32}}, color = {95, 95, 95}));
  connect(tool_tip_spring.frame_b, tool_tip_position.frame_b) annotation(
    Line(points = {{0, 90}, {24, 90}, {24, 78}, {160, 78}, {160, 32}}, color = {95, 95, 95}));
  connect(tool_shank_spring.frame_b, tool_shank_position.frame_b) annotation(
    Line(points = {{0, 30}, {34, 30}, {34, 68}, {130, 68}, {130, 50}, {130, 50}, {130, 32}, {120, 32}, {120, 32}}));
  connect(tool_target.frame_a, b_axis.frame_a) annotation(
    Line(points = {{-108, -56}, {-102, -56}, {-102, -50}, {-80, -50}, {-80, -50}}));
  connect(tool_shank_target.frame_a, tool_target.frame_b) annotation(
    Line(points = {{-152, -56}, {-128, -56}, {-128, -56}, {-128, -56}}));
  connect(tool_shank_spring.frame_a, tool_shank_target.frame_b) annotation(
    Line(points = {{-20, 30}, {-198, 30}, {-198, -56}, {-172, -56}, {-172, -56}}, color = {95, 95, 95}));
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
    Line(points = {{-146, -12}, {-136, -12}, {-136, -44}, {-152, -44}, {-152, -44}}, color = {0, 0, 127}, thickness = 0.5));
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
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})));end Machine;