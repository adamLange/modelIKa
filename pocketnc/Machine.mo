within PocketNC;

model Machine
  Modelica.Mechanics.MultiBody.Joints.Revolute b_axis(a(fixed = false), phi(fixed = true), useAxisFlange = true, w(fixed = true, start = 10))  annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1 annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute a_axis(a(fixed = false), n = {1, 0, 0}, phi(fixed = true), useAxisFlange = true, w(fixed = true, start = 10))  annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic y_axis(n = {0, 1, 0}, s(fixed = true), useAxisFlange = true, v(fixed = true))  annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic x_axis(s(fixed = true), useAxisFlange = true, v(fixed = true))  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic z_axis(n = {0, 0, 1}, s(fixed = true), useAxisFlange = true, v(fixed = true))  annotation(
    Placement(visible = true, transformation(origin = {70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)  annotation(
    Placement(visible = true, transformation(origin = {-66, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Spring tool_tip_spring(c = 100000)  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Spring tool_shank_spring(c = 100000)  annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper b_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {-70, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper a_damper(d = 100)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper y_damper(d = 1000)  annotation(
    Placement(visible = true, transformation(origin = {50, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper x_damper(d = 1000)  annotation(
    Placement(visible = true, transformation(origin = {70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper z_damper(d = 1000)  annotation(
    Placement(visible = true, transformation(origin = {70, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_tip_target(r = {0.030, 0.030, 0.030})  annotation(
    Placement(visible = true, transformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_shank_target(r = {0, 0, 0.050})  annotation(
    Placement(visible = true, transformation(origin = {-170, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_shank_position(r = {0, 0, -0.010})  annotation(
    Placement(visible = true, transformation(origin = {110, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tool_tip_position(r = {0, 0, -0.050})  annotation(
    Placement(visible = true, transformation(origin = {150, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body workpiece_mass(m = 1, r_CM = {0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-144, -74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body spindle_mass(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {138, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 1) annotation(
    Placement(visible = true, transformation(origin = {140, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body2(m = 1) annotation(
    Placement(visible = true, transformation(origin = {126, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body3(m = 1) annotation(
    Placement(visible = true, transformation(origin = {26, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body4(m = 1) annotation(
    Placement(visible = true, transformation(origin = {-6, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle = 90, n = {0, 1, 0})  annotation(
    Placement(visible = true, transformation(origin = {-138, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  connect(tool_tip_target.frame_b, b_axis.frame_a) annotation(
    Line(points = {{-100, -50}, {-80, -50}, {-80, -50}, {-80, -50}}, color = {95, 95, 95}));
  connect(z_axis.frame_b, tool_shank_position.frame_a) annotation(
    Line(points = {{80, 32}, {100, 32}, {100, 32}, {100, 32}}));
  connect(tool_shank_position.frame_b, tool_tip_position.frame_a) annotation(
    Line(points = {{120, 32}, {138, 32}, {138, 32}, {140, 32}}, color = {95, 95, 95}));
  connect(tool_tip_spring.frame_a, tool_tip_target.frame_a) annotation(
    Line(points = {{-20, 50}, {-120, 50}, {-120, -50}, {-120, -50}}));
  connect(tool_shank_target.frame_a, tool_shank_spring.frame_a) annotation(
    Line(points = {{-180, -50}, {-204, -50}, {-204, 18}, {-152, 18}, {-152, 30}, {-20, 30}}, color = {95, 95, 95}));
  connect(tool_tip_spring.frame_b, tool_tip_position.frame_b) annotation(
    Line(points = {{0, 50}, {24, 50}, {24, 78}, {160, 78}, {160, 32}, {160, 32}}, color = {95, 95, 95}));
  connect(tool_shank_spring.frame_b, tool_shank_position.frame_b) annotation(
    Line(points = {{0, 30}, {34, 30}, {34, 68}, {130, 68}, {130, 50}, {130, 50}, {130, 32}, {120, 32}, {120, 32}}));
  connect(workpiece_mass.frame_a, b_axis.frame_a) annotation(
    Line(points = {{-134, -74}, {-96, -74}, {-96, -50}, {-80, -50}, {-80, -50}}, color = {95, 95, 95}));
  connect(z_axis.frame_b, spindle_mass.frame_a) annotation(
    Line(points = {{80, 32}, {94, 32}, {94, 8}, {128, 8}, {128, 8}}));
  connect(body1.frame_a, x_axis.frame_b) annotation(
    Line(points = {{130, -34}, {108, -34}, {108, -20}, {80, -20}, {80, -20}}));
  connect(body2.frame_a, y_axis.frame_b) annotation(
    Line(points = {{116, -68}, {98, -68}, {98, -50}, {60, -50}, {60, -50}}));
  connect(body3.frame_a, a_axis.frame_b) annotation(
    Line(points = {{16, -110}, {10, -110}, {10, -82}, {32, -82}, {32, -50}, {20, -50}, {20, -50}}, color = {95, 95, 95}));
  connect(body4.frame_a, b_axis.frame_b) annotation(
    Line(points = {{-16, -92}, {-30, -92}, {-30, -64}, {-46, -64}, {-46, -50}, {-60, -50}, {-60, -50}}, color = {95, 95, 95}));
  connect(fixedRotation1.frame_b, tool_tip_target.frame_a) annotation(
    Line(points = {{-128, -50}, {-120, -50}, {-120, -50}, {-120, -50}}, color = {95, 95, 95}));
  connect(tool_shank_target.frame_b, fixedRotation1.frame_a) annotation(
    Line(points = {{-160, -50}, {-148, -50}, {-148, -50}, {-148, -50}}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})));end Machine;