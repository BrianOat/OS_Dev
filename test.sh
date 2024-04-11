#!/bin/bash

aarch64-linux-gnu-as ./src/Aarch64/kernel.s -o ./build/kernel.o
aarch64-linux-gnu-ld ./build/kernel.o -o kernel
./qemu/build/qemu-system-aarch64 -M raspi4b -nographic -kernel kernel

