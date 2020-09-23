# modelIKa 
### _An [inverse kinematics](https://en.wikipedia.org/wiki/Inverse_kinematics) solver based on [modelica](https://en.wikipedia.org/wiki/Modelica)_

    model-I-K-a
          n i
          v n
          e e
          r m
          s a
          e t
            i
            c
            s

## About modelIKa

At the highest level you can say modelIKa is a server that solves for the joint positions of your machine when you
make a request to the server to solve for a given end effector position.

## How to use modelIKa to solve your inverse kinematics problem

  1. Create a model of your machine in modelica using the modelica standard library's MultiBody mechanics module. 
      I made a model of my PocketNC 5-axis milling machine and it's included in this repository to serve as an example.
      It's in the modelica module named IK.Machine.
      Omit your machine's motors.  Basically what's going to happen is that springs are going to pull your machine's
      end effector to it's target position.  You might want to add non-physical dampers and/or mass to the model to
      smooth oscillations and to optimize solutions.
      
  2. Add IK.ToolTargets and IK.ControlInterfaceUtilities.Control interface objects to your model. Connect springs from your
     machine's end effectors to the ToolTargets.  
     IK is a modelica module included in this repository.  
     There's a little art to making the springs between the tool targets and 
     the machines end effectors work.  If the spring length goes to zero or very close to zero the simulation will crash.

  3. Write a python program that imports ModelIKa and create a IKClient instance. You can call:
  
    from ModelIKa import IKClient
    iksolver = IKClient("127.0.0.1",8826)
    # I,J,K,U,V,W define the end effector target positions
    # x,y,z,a,b are the joint positions
    x,y,z,a,b = iksolver.solve((I,J,K,U,V,W),1e-6,False) # you can call this over and over again for different end effector targets
    
  4. Start the modelica simulation.  Open your machine model in a modelica tool ([OpenModelica](https://www.openmodelica.org/) is a good one!). 
     Set the simulation to run for a long time and execute the simulation.  The simulation will start but not progress until
     a request is made by the client (the program you wrote above in step 3).
     
  5. Run your program.  The modelica simulation will progress as requests are made to it from the client program.
