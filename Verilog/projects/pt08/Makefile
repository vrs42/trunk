
obj_dir/pt08.vcd: obj_dir/Vpt08
	cd obj_dir; ./Vpt08

obj_dir/Vpt08: obj_dir/Vpt08.cpp sim_main.cpp
	cd obj_dir; make -f Vpt08.mk

Vpt08.cpp: pt08.v e2.v e11.v m706.v m707.v pup.v
	verilator --profile-cfuncs --trace --exe -Wno-fatal -cc --top-module pt08 sim_main.cpp pt08.v e2.v e11.v m706.v m707.v pup.v

display: obj_dir/pt08.vcd
	cd obj_dir; gtkwave pt08.gtkw &
