/* Copyright 2019 SiFive, Inc */
/* SPDX-License-Identifier: Apache-2.0 */
/* ----------------------------------- */
/* ----------------------------------- */

#ifndef METAL_PLATFORM_H
#define METAL_PLATFORM_H

/* From clint@2000000 */
#define METAL_RISCV_CLINT0_2000000_BASE_ADDRESS 33554432UL
#define METAL_RISCV_CLINT0_0_BASE_ADDRESS 33554432UL
#define METAL_RISCV_CLINT0_2000000_SIZE 65536UL
#define METAL_RISCV_CLINT0_0_SIZE 65536UL

#define METAL_RISCV_CLINT0
#define METAL_RISCV_CLINT0_MSIP_BASE 0UL
#define METAL_RISCV_CLINT0_MTIMECMP_BASE 16384UL
#define METAL_RISCV_CLINT0_MTIME 49144UL

/* From interrupt_controller@c000000 */
#define METAL_RISCV_PLIC0_C000000_BASE_ADDRESS 201326592UL
#define METAL_RISCV_PLIC0_0_BASE_ADDRESS 201326592UL
#define METAL_RISCV_PLIC0_C000000_SIZE 67108864UL
#define METAL_RISCV_PLIC0_0_SIZE 67108864UL
#define METAL_RISCV_PLIC0_C000000_RISCV_MAX_PRIORITY 7UL
#define METAL_RISCV_PLIC0_0_RISCV_MAX_PRIORITY 7UL
#define METAL_RISCV_PLIC0_C000000_RISCV_NDEV 54UL
#define METAL_RISCV_PLIC0_0_RISCV_NDEV 54UL

#define METAL_RISCV_PLIC0
#define METAL_RISCV_PLIC0_PRIORITY_BASE 0UL
#define METAL_RISCV_PLIC0_PENDING_BASE 4096UL
#define METAL_RISCV_PLIC0_ENABLE_BASE 8192UL
#define METAL_RISCV_PLIC0_ENABLE_PER_HART 128UL
#define METAL_RISCV_PLIC0_CONTEXT_BASE 2097152UL
#define METAL_RISCV_PLIC0_CONTEXT_PER_HART 4096UL
#define METAL_RISCV_PLIC0_CONTEXT_THRESHOLD 0UL
#define METAL_RISCV_PLIC0_CONTEXT_CLAIM 4UL

/* From test@100000 */
#define METAL_SIFIVE_TEST0_100000_BASE_ADDRESS 1048576UL
#define METAL_SIFIVE_TEST0_0_BASE_ADDRESS 1048576UL
#define METAL_SIFIVE_TEST0_100000_SIZE 4096UL
#define METAL_SIFIVE_TEST0_0_SIZE 4096UL

#define METAL_SIFIVE_TEST0
#define METAL_SIFIVE_TEST0_FINISHER_OFFSET 0UL

/* From uart@10013000 */
//#define METAL_SIFIVE_UART0_10013000_BASE_ADDRESS 268513280UL
//#define METAL_SIFIVE_UART0_0_BASE_ADDRESS 268513280UL
#define METAL_SIFIVE_UART0_10013000_SIZE 4096UL
#define METAL_SIFIVE_UART0_0_SIZE 4096UL

#define METAL_SIFIVE_UART0
#define METAL_SIFIVE_UART0_TXDATA 0UL
#define METAL_SIFIVE_UART0_RXDATA 4UL
#define METAL_SIFIVE_UART0_TXCTRL 8UL
#define METAL_SIFIVE_UART0_RXCTRL 12UL
#define METAL_SIFIVE_UART0_IE 16UL
#define METAL_SIFIVE_UART0_IP 20UL
#define METAL_SIFIVE_UART0_DIV 24UL

#endif /* METAL_PLATFORM_H*/
