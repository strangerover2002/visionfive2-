PROG	?= rtos
COMPILER      ?= riscv64-unknown-elf-
RISCV_XLEN := 64
DEBUG    ?= true
USE_CACHE ?= false
HWDSP     ?= false
V	  ?= 1

# Mode: LOAD, BURN, XIP
MODE	?= LOAD
BOARD	:= ORCA

#PLATNAME = $(shell echo $(patsubst CF1-%,%,$(PLAT)) | tr A-Z a-z)
TGT = EC1

CC	    := $(COMPILER)gcc
C++     := $(COMPILER)g++
OBJDUMP	:= $(COMPILER)objdump
OBJCOPY := $(COMPILER)objcopy
AR	    := $(COMPILER)ar
AS	    := $(COMPILER)as

OPTIM   := -O0 -ggdb



# Define the directories
RTOS_DIR	= ./rtos

# Define the source files we have

# BSP source files
STARTUP_SRCS = freedom-metal/src/entry.S

SRC = \
    src/example-freertos-blinky.c \
    src/Bridge_Freedom-metal_FreeRTOS.c \

SRC += \
	freedom-metal/gloss/sys_openat.c \
	freedom-metal/gloss/sys_getpid.c \
	freedom-metal/gloss/sys_chown.c \
	freedom-metal/gloss/sys_write.c \
	freedom-metal/gloss/sys_chdir.c \
	freedom-metal/gloss/sys_access.c \
	freedom-metal/gloss/sys_open.c \
	freedom-metal/gloss/sys_fstat.c \
	freedom-metal/gloss/sys_fork.c \
	freedom-metal/gloss/sys_sbrk.c \
	freedom-metal/gloss/sys_read.c \
	freedom-metal/gloss/sys_chmod.c \
	freedom-metal/gloss/sys_kill.c \
	freedom-metal/gloss/nanosleep.c \
	freedom-metal/gloss/sys_isatty.c \
	freedom-metal/gloss/sys_stat.c \
	freedom-metal/gloss/sys_utime.c \
	freedom-metal/gloss/sys_lstat.c \
	freedom-metal/gloss/sys_sysconf.c \
	freedom-metal/gloss/sys_faccessat.c \
	freedom-metal/gloss/sys_gettimeofday.c \
	freedom-metal/gloss/sys_exit.c \
	freedom-metal/gloss/sys_unlink.c \
	freedom-metal/gloss/sys_link.c \
	freedom-metal/gloss/sys_execve.c \
	freedom-metal/gloss/sys_wait.c \
	freedom-metal/gloss/sys_ftime.c \
	freedom-metal/gloss/sys_getcwd.c \
	freedom-metal/gloss/sys_close.c \
	freedom-metal/gloss/sys_lseek.c \
	freedom-metal/gloss/sys_fstatat.c \
	freedom-metal/gloss/sys_clock_gettime.c \
	freedom-metal/gloss/sys_times.c \

	
	
SRC += \
	freedom-metal/src/init.c \
	freedom-metal/src/led.c \
	freedom-metal/src/pmp.c \
	freedom-metal/src/hpm.c \
	freedom-metal/src/switch.c \
	freedom-metal/src/i2c.c \
	freedom-metal/src/rtc.c \
	freedom-metal/src/cpu.c \
	freedom-metal/src/timer.c \
	freedom-metal/src/interrupt.c \
	freedom-metal/src/atomic.c \
	freedom-metal/src/memory.c \
	freedom-metal/src/pwm.c \
	freedom-metal/src/button.c \
	freedom-metal/src/synchronize_harts.c \
	freedom-metal/src/uart.c \
	freedom-metal/src/gpio.c \
	freedom-metal/src/lock.c \
	freedom-metal/src/cache.c \
	freedom-metal/src/tty.c \
	freedom-metal/src/drivers/sifive_l2pf0.c \
	freedom-metal/src/drivers/sifive_rtc0.c \
	freedom-metal/src/drivers/sifive_buserror0.c \
	freedom-metal/src/drivers/sifive_fe310-g000_hfrosc.c \
	freedom-metal/src/drivers/sifive_test0.c \
	freedom-metal/src/drivers/sifive_i2c0.c \
	freedom-metal/src/drivers/sifive_gpio0.c \
	freedom-metal/src/drivers/sifive_gpio-switches.c \
	freedom-metal/src/drivers/sifive_gpio-buttons.c \
	freedom-metal/src/drivers/riscv_clint0.c \
	freedom-metal/src/drivers/sifive_uart0.c \
	freedom-metal/src/drivers/sifive_fe310-g000_prci.c \
	freedom-metal/src/drivers/sifive_trace.c \
	freedom-metal/src/drivers/ucb_htif0.c \
	freedom-metal/src/drivers/sifive_wdog0.c \
	freedom-metal/src/drivers/sifive_global-external-interrupts0.c \
	freedom-metal/src/drivers/sifive_pwm0.c \
	freedom-metal/src/drivers/sifive_gpio-leds.c \
	freedom-metal/src/drivers/riscv_plic0.c \
	freedom-metal/src/drivers/sifive_ccache0.c \
	freedom-metal/src/drivers/sifive_simuart0.c \
	freedom-metal/src/drivers/sifive_fe310-g000_pll.c \
	freedom-metal/src/drivers/sifive_fe310-g000_hfxosc.c \
	freedom-metal/src/drivers/sifive_spi0.c \
	freedom-metal/src/drivers/sifive_fe310-g000_lfrosc.c \
	freedom-metal/src/drivers/sifive_local-external-interrupts0.c \
	freedom-metal/src/drivers/inline.c \
	freedom-metal/src/drivers/riscv_cpu.c \
	freedom-metal/src/drivers/fixed-clock.c \
	freedom-metal/src/drivers/fixed-factor-clock.c \
	freedom-metal/src/drivers/sifive_clic0.c \
	freedom-metal/src/privilege.c \
	freedom-metal/src/time.c \
	freedom-metal/src/shutdown.c \
	freedom-metal/src/spi.c \
	freedom-metal/src/watchdog.c \
	freedom-metal/src/clock.c \
	

# Kernel source files
SRC += \
	FreeRTOS-metal/FreeRTOS-Kernel/list.c \
	FreeRTOS-metal/FreeRTOS-Kernel/queue.c \
	FreeRTOS-metal/FreeRTOS-Kernel/tasks.c \
	FreeRTOS-metal/FreeRTOS-Kernel/timers.c \
	FreeRTOS-metal/FreeRTOS-Kernel/event_groups.c \
	FreeRTOS-metal/FreeRTOS-Kernel/portable/GCC/RISC-V/port.c \
	FreeRTOS-metal/FreeRTOS-Kernel/portable/MemMang/heap_2.c \
	FreeRTOS-metal/FreeRTOS-Kernel/portable/Common/mpu_wrappers.c \
	FreeRTOS-metal/FreeRTOS-Kernel/stream_buffer.c \
	FreeRTOS-metal/FreeRTOS-Kernel/portable/GCC/RISC-V/pmp.c \
	FreeRTOS-metal/FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S 

SRC += \
	freedom-metal/src/trap.S \
	freedom-metal/src/vector.S \
	freedom-metal/src/scrub.S \
	freedom-metal/gloss/crt0.S \

	
	
	
# Define all object files.
SRCS = $(STARTUP_SRCS) $(SRC)
OBJS = $(patsubst %.S,%.o,$(patsubst %.cpp,%.o,$(patsubst %.c,%.o,${SRCS})))

TRACE_CC  =
TRACE_C++ =
TRACE_LD  =
TRACE_AR  =
TRACE_AS  =
Q=

# Compilation options

LDSCRIPT = bsp/metal.freertos.lds

#
# FreeRTOS needs to define an "portasmHANDLE_INTERRUPT" assembler macro to tell
# the FreeRTOS kernel which external interrupt handler to call.
# Besides, it also needs to specify the linker variable called "__freertos_irq_stack_top"
# that holds the highest address of the interrupt stack. We set __freertos_irq_stack_top
# to equal the value of linker variable "_stack".
#
DEFINES = -DCFG_$(BOARD) -DCFG_$(MODE) -DportasmHANDLE_INTERRUPT=FreeRTOS_IRQ_handler -D__freertos_irq_stack_top=_stack

INCLUDES = \
	-I. \
	-I/home/user/work/SiFive/freedomstudio/SiFive/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8/riscv64-unknown-elf/include \
	-IFreeRTOS-metal/FreeRTOS-Kernel/include \
	-IFreeRTOS-metal/FreeRTOS-Kernel/portable/GCC/RISC-V \
	-Isrc \
	-Ibsp/install/include \
	-Ibsp/install/include/metal \
	-IFreeRTOS-metal/FreeRTOS-Kernel/portable/GCC/RISC-V/chip_specific_extensions/RV32I_CLINT_no_extensions \
	-Iuboot_include \

CFLAGS = \
	-march=rv64imafdc -mabi=lp64d -mcmodel=medany \
	$(OPTIM) $(INCLUDES) $(DEFINES) \
	-fomit-frame-pointer -fno-strict-aliasing -fno-builtin -funroll-loops \
	-ffunction-sections -fdata-sections \

CXXFLAGS = $(CFLAGS)

ASFLAGS = -D__ASSEMBLY__ $(CFLAGS) -c

LDFLAGS = -T$(LDSCRIPT) $(OPTIM) -static -nostartfiles -Wl,--gc-sections

### Make variables

ifeq ($(USE_CACHE), 1)
	CFLAGS += -DCFG_CACHE_ENABLE
endif

ifeq ($(USE_HWDSP), 1)
	CFLAGS += -mext-dsp
	LDFLAGS += -mext-dsp
endif

# Compilation rules
.SUFFIXES : %.o %.c %.cpp %.S

%.o: %.c
	$(TRACE_CC)
	$(Q)$(CC) -c -MMD $(CFLAGS) -o $@ $<

%.o: %.cpp
	$(TRACE_C++)
	$(Q)$(C++) -c -MMD $(CXXFLAGS) -o $@ $<

%.o: %.S
	$(TRACE_CC)
	$(Q)$(CC) -c -MMD $(CFLAGS) -o $@ $<

all: $(PROG).elf

$(PROG).elf  : $(OBJS) makefile
	$(TRACE_LD)
	$(Q)$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
	$(OBJCOPY) -O binary -S $(PROG).elf $(PROG).bin
	$(OBJDUMP) -d $(PROG).elf > $(PROG).asm
	riscv64-unknown-elf-size $(PROG).elf
	@echo Completed

clean :
	@rm -f $(OBJS) $(OBJS:.o=.d)
	@rm -f $(PROG).elf
	@rm -f $(PROG).bin
	@rm -f $(PROG).asm

# Automatic dependency generation
ifneq ($(MAKECMDGOALS),clean)
-include $(OBJS:.o=.d)
endif


