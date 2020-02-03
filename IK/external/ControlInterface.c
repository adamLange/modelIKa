#include "ModelicaUtilities.h"
#include <stdlib.h>

typedef struct {
  double tool_tip_position[3];
} ControlInterface;


void *ControlInterface_constructor(){
  ModelicaMessage("ControllerInterface initializing.\n");
  ControlInterface *obj = malloc(sizeof(ControlInterface));
  obj->tool_tip_position[0] = -1e-6;
  obj->tool_tip_position[1] = 0.0;
  obj->tool_tip_position[2] = 0.0;
  return (void *)obj;
}

void ControlInterface_destructor(void *obj){
  //free(obj);
}

void ControlInterface_update(void *obj,
                                double *xyzab,
                                double *tool_tip_position,
                                double *tool_orientation,
                                double *tolerance,
                                int *shutdown
){
   ModelicaMessage("ControlInterface_update\n");
   ControlInterface *ctlInt = (ControlInterface *)obj;

   ctlInt->tool_tip_position[0] = ctlInt->tool_tip_position[0] + 0.001;
   ctlInt->tool_tip_position[1] = ctlInt->tool_tip_position[1] + 0.001;
   ctlInt->tool_tip_position[2] = ctlInt->tool_tip_position[2] + 0.001;

   tool_tip_position[0] = ctlInt->tool_tip_position[0];
   tool_tip_position[1] = ctlInt->tool_tip_position[1];
   tool_tip_position[2] = ctlInt->tool_tip_position[2];

   tool_orientation[0] = 0.000;
   tool_orientation[1] = 0.000;
   tool_orientation[2] = 0.50 + 1e-6;

   tolerance[0] = 1e-6;
   tolerance[1] = 1e-6;

   *shutdown = 0;

}
