cmake_minimum_required(VERSION 3.26)
project(Arcane)

set(ARCANE_COMPONENT_SCRIPT_TYPE ${CMAKE_GENERATOR})
set(ARCANE_COMPONENT_SCRIPT_CMD ${CMAKE_MAKE_PROGRAM})
set(ARCANE_ARTIFACTS_PATH ${CMAKE_CURRENT_SOURCE_DIR}/Artifacts)

include(${CMAKE_SOURCE_DIR}/Scripts/module.cmake)

arcane_component(TestToolchain generic-riscv64-llvm)
