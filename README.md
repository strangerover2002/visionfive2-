# visionfive2-freertos

The make and source files have only been tested from a Linux host.

Using SiFive toolchain https://github.com/sifive/freedom-tools/releases
riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-centos6.tar.gz

make all:- 
will build the project assuming that SiFive tools are in your PATH

make gdb:- 
will run the gdb debugger, gdbinit should be renamed to .gdbiinit 
	
make ocd:- 
will run openocd, u74.cfg is the configuration file


