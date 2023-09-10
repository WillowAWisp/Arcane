cmake_minimum_required(VERSION 3.26)
project(Arcane::Runit ASM CXX)

if(NOT CMAKE_CROSSCOMPILING)
  message(FATAL_ERROR "CMAKE_CROSSCOMPILING isn't set, is your project configured correctly?")
endif()

if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "riscv64")

  message(STATUS "Building Runit with riscv support.")
  set(RUNIT_PLATFORM_PATH ${CMAKE_CURRENT_LIST_DIR}/platform/riscv64)
  add_compile_options(
    -ffreestanding
    -mcmodel=medium
    -nostdlib
    -T${RUNIT_PLATFORM_PATH}/link.ld
  )
  add_link_options(
    -ffreestanding
    -mcmodel=medium
    -nostdlib
    -T${RUNIT_PLATFORM_PATH}/link.ld
  )

  set(PLATFORM_SOURCES
    platform/riscv64/prelude/prelude.asm
    platform/riscv64/prelude/initialize.cc

    platform/riscv64/hal/sbi.asm

    platform/riscv64/impl/print_line.cc
    platform/riscv64/impl/verify.cc
  )

  add_compile_definitions(PLATFORM_NAME=riscv64)

endif()

set(SOURCES
  ${PLATFORM_SOURCES}
  runit.cc
)

add_executable(runit ${SOURCES})
target_include_directories(runit PRIVATE ${CMAKE_CURRENT_LIST_DIR} ${RUNIT_PLATFORM_PATH})
