libControlInterface: ControlInterface.c
	gcc -c -Wall -Werror -fpic ControlInterface.c -I/home/adam/projects/OpenModelica/build/include/omc/c $$(python3.6-config --includes) 
	gcc -shared -o libControlInterface.so ControlInterface.o $$(python3.6-config --ldflags)
