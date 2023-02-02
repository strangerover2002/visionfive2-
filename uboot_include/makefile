all:
	make -f build.make V=0
clean:
	make -f build.make clean
	
gdb:
	riscv64-unknown-elf-gdb
	
tty:
	putty -serial /dev/pts/2

ocd:
	openocd \
	-f /home/user/sandpit/openocd-bin/share/openocd/scripts/interface/jlink.cfg  \
    -c "transport select jtag" -c "adapter_khz 10000"  \
    -f /home/user/sandpit/openocd-bin/u74.cfg
