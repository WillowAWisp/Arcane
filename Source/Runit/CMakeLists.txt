cmake_minimum_required(VERSION 3.26)
project(Arcane::Runit ASM CXX)

if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "riscv64")

  message(STATUS "Building Runit with riscv support.")
  set(RUNIT_PLATFORM_PATH ${CMAKE_CURRENT_LIST_DIR}/platform/riscv64)
  add_compile_options(-ffreestanding -mcmodel=medium -nostdlib -T${RUNIT_PLATFORM_PATH}/link.ld)
  add_link_options(-ffreestanding -mcmodel=medium -nostdlib -T${RUNIT_PLATFORM_PATH}/link.ld)

  set(PLATFORM_SOURCES
    platform/riscv64/runit.asm
    platform/riscv64/runit.cc
  )

endif()

set(SOURCES
  ${PLATFORM_SOURCES}
)

add_executable(runit ${SOURCES})

target_include_directories(runit PRIVATE "${CMAKE_CURRENT_LIST_DIR}")
