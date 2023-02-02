target remote localhost:1234    
#target remote localhost:2331   #segger
set mem inaccessible-by-default off
monitor reset
flushregs
file rtos.elf
#layout split
load
b main
set $pc = _enter



define restart
monitor reset
flushregs
set $pc = _enter
end

