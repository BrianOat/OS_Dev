cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(Kernel VERSION 1.0)

# Specify the cross-compilers for aarch64 (Raspberry Pi 4)
set(CMAKE_C_COMPILER "aarch64-linux-gnu-gcc")

# Set the C standard to use
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

# Add the assembly file to the project
enable_language(ASM)

# Specify the directory where the linker script can be found
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/linker.ld)

# Add the source files
add_executable(kernel.elf
    boot.s
    kernel.c
    stdio.c
)

# Set the linker script
set_target_properties(kernel.elf PROPERTIES LINK_FLAGS "-T ${LINKER_SCRIPT} -nostdlib -nostartfiles")
