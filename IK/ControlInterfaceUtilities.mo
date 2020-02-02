within IK;

package ControlInterfaceUtilities
  model ControlInterface
    parameter Real tolerance_i[2] = {1e-7, 1e-7};
    parameter Real tool_tip_position_i[3] = {0, 0, 0};
    parameter Real tool_tip_orientation_i[3] = {0, 0, 0};
    discrete Real tolerance[2];
    Modelica.Blocks.Interfaces.RealInput error[2] annotation(
      Placement(visible = true, transformation(origin = {-98, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput tool_tip_position[3] annotation(
      Placement(visible = true, transformation(origin = {82, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput tool_orientation[3] annotation(
      Placement(visible = true, transformation(origin = {72, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ControlInterfaceObject ctlObj = ControlInterfaceObject();
  initial equation
//tolerance = tolerance_i;
    tool_tip_position = tool_tip_position_i;
  equation
    tool_orientation = tool_tip_orientation_i;
    tolerance = tolerance_i;
    when error[1] <= tolerance[1] and error[2] <= tolerance[2] then
      tool_tip_position = pre(tool_tip_position) + {1e-4, 1e-4, 1e-4};
    end when;
    annotation(
      Icon(graphics = {Rectangle(origin = {-3, 23}, extent = {{-97, 77}, {103, -123}}), Text(origin = {-27, 65}, extent = {{-23, 13}, {77, -49}}, textString = "ControlInterface")}));
  end ControlInterface;

  class ControlInterfaceObject
    extends ExternalObject;

    function constructor
      output ControlInterfaceObject obj;
    
      external "C" obj = ControlInterface_constructor() annotation(
        Library = "ControlInterface",
        LibraryDirectory = "modelica://IK/external");
    end constructor;

    function destructor
      input ControlInterfaceObject obj;
    
      external "C" obj = ControlInterface_destructor() annotation(
        Library = "ControlInterface",
        LibraryDirectory = "modelica://IK/external");
    end destructor;
  end ControlInterfaceObject;

  impure function update
    input ConnectionObject conObj;
    input Real xyzab[5];
    output Real tool_tip_position[3];
    output Real tool_orientation[3];
    output Real tolerance[2];
    output Boolean shutdown;
  
    external "C" update(conObj, xyzab, tool_tip_position, tool_orientation, tolerance, shutdown) annotation(
      Library = "ControlInterface",
      LibraryDirectory = "modelica://IK/external");
  end update;
end ControlInterfaceUtilities;