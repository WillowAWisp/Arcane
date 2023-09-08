set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

set(TOOLCHAIN_ROOT "${ARCANE_PATH}/Utils/toolchains/llvm/local/clang")

set(CMAKE_C_FLAGS "--target=riscv64 -std=c17" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS "--target=riscv64 -std=c++20" CACHE INTERNAL "")
set(CMAKE_ASM_FLAGS "--target=riscv64" CACHE INTERNAL "")

set(CMAKE_C_COMPILER ${TOOLCHAIN_ROOT}/bin/clang)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_ROOT}/bin/clang++)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_ROOT}/bin/clang)

set(CMAKE_C_COMPILER_WORKS ON)
set(CMAKE_CXX_COMPILER_WORKS ON)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
