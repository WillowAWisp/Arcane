cmake_minimum_required(VERSION 3.26)
project(Arcane::TestToolchain C CXX ASM)

set(SOURCES
  test.asm
)

# Override Flags for Machine Code :3
set(CMAKE_ASM_FLAGS "--target=riscv64 -mcmodel=medium -nostdlib -T${CMAKE_CURRENT_LIST_DIR}/ls.ld")

add_executable(riscv_test ${SOURCES})
