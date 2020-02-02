#include "ModelicaUtilities.h"
#include <stdlib.h>

typedef struct {
  
} ControlInterface;


void *ControlInterface_constructor(){
  //ModelicaMessage("ControllerInterface initializing.\n");
  return malloc(sizeof(int)*10);
}

void ControlInterface_destructor(void *obj){
  free(obj);
}

void ControlInterface_update(void *obj,
                                double *xyzab,
                                double *tool_tip_position,
                                double *tool_orientation,
                                double *tolerance,
                                int *shutdown
){

   tool_tip_position[0] = 0.010;
   tool_tip_position[1] = 0.010;
   tool_tip_position[2] = 0.010;

   tool_orientation[0] = 0.050001;
   tool_orientation[1] = 0;
   tool_orientation[2] = 0;

   *tolerance = 1e-6;

   *shutdown = 0;

}
