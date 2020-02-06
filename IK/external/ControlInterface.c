#include "ModelicaUtilities.h"
#include <stdlib.h>

#define PY_SSIZE_T_CLEAN
#include <Python.h>

typedef struct {
  PyObject *pPostProcessor;
} ControlInterface;


void *ControlInterface_constructor(){
  ModelicaMessage("ControllerInterface initializing.\n");
  ControlInterface *obj = malloc(sizeof(ControlInterface));
  Py_Initialize();
  PyObject *pModule = PyImport_ImportModule("ModelIKa");
  obj->pPostProcessor = PyObject_CallMethod(pModule,"PostProcessor","s","spagetti");
  Py_DECREF(pModule);
  return (void *)obj;
}

void ControlInterface_destructor(void *obj){
  //ControlInterface *ctlInt = (ControlInterface *)obj;
  //PyObject_CallMethod(ctlInt->pPostProcessor,"finalize","");
  Py_FinalizeEx();
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

   PyObject *pResult = PyObject_CallMethod(ctlInt->pPostProcessor,"IK_step","ddddd",
     xyzab[0],
     xyzab[1],
     xyzab[2],
     xyzab[3],
     xyzab[4]
   );
   double tx,ty,tz,ox,oy,oz,tt,to;
   int quit;
   PyArg_ParseTuple(pResult,"ddddddddp",&tx,&ty,&tz,&ox,&oy,&oz,&tt,&to,&quit);
   Py_DECREF(pResult);

   tool_tip_position[0] = tx;
   tool_tip_position[1] = ty;
   tool_tip_position[2] = tz;

   tool_orientation[0] = ox;
   tool_orientation[1] = oy;
   tool_orientation[2] = oz;

   tolerance[0] = tt;
   tolerance[1] = to;

   *shutdown = quit;

}
