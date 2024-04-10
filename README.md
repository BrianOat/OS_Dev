# OS_Dev

This is a repository for developing an Operating System from scratch to reinforce theoretical OS concepts and learn via a hands on approach. The OS will be developed entirely in C and Aarch64 Assembly. We will be utilizing QEMU to emulate a ARM64 CPU for testing the kernel.

## Install Cross Compiler 
Most laptops and computers use x86 processors. Cross Compilation allows you to compile binary for a completely different processor architecture. 
```bash
sudo apt-get update
sudo apt install gcc-aarch64-linux-gnu
```

## Install QEMU
QEMU is an emulator for different processor architectures, which will be used for kernel testing purposes without needing the hardware.
```bash
git clone https://gitlab.com/qemu-project/qemu.git
cd qemu
git submodule init
git submodule update --recursive
./configure --target-list=aarch64-softmmu
# Execute commands in parallel, I have 32 core system so -j32
make -j32
```

## Assembling the Kernel

```bash
aarch64-linux-gnu-as -o kernel.o kernel.s
aarch64-linux-gnu-ld -o kernel kernel.o
```

## Test the OS using QEMU
Note: To terminate press Ctrl+a and then press x
```bash
./qemu-system-aarch64 -M raspi4b -nographic -kernel kernel
```
