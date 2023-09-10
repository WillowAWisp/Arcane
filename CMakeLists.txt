cmake_minimum_required(VERSION 3.26)
project(Arcane)

include(${CMAKE_SOURCE_DIR}/Scripts/module.cmake)

set(ARCANE_COMPONENT_SCRIPT_TYPE ${CMAKE_GENERATOR})
set(ARCANE_COMPONENT_SCRIPT_CMD ${CMAKE_MAKE_PROGRAM})
set(ARCANE_TARGET_ARCH generic-riscv64-llvm CACHE STRING "")
set(ARCANE_ARTIFACTS_PATH ${CMAKE_CURRENT_SOURCE_DIR}/Artifacts)

arcane_component(Runit generic-riscv64-llvm)

