./bin/openocd -f /home/user/sandpit/openocd-bin/share/openocd/scripts/interface/jlink.cfg  \
    -c "transport select jtag" -c "adapter_khz 1000"  \
    -f /home/user/sandpit/openocd-bin/u74.cfg
