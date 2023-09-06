#!/usr/bin/env bash

source "$UTILS_PATH/libbuildit.sh"

println "llvm/scripts/buildit.sh" "dependency_check" echo "Checking for dependencies"
  dependency_check "llvm/scripts/buildit.sh" "Ninja" "ninja --version"
  dependency_check "llvm/scripts/buildit.sh" "CMake" "cmake --version"

  # Check the C compiler.

  echo "int main() {return 0;}" | ${CC:-cc} -o /dev/null -xc - > /dev/null
  ccld_check "llvm/scripts/buildit.sh" "C Compiler" $?

  echo "int main() {return 0;}" | ${CXX:-c++} -o /dev/null -xc - > /dev/null
  ccld_check "llvm/scripts/buildit.sh" "C++ Compiler" $?
println "llvm/scripts/buildit.sh" "downloading" echo "Downloading tarball"
  LLVM_NAME=llvm-project-16.0.6.src
  # Download LLVM 16.0.6
  download                                                                                                \
    https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/$LLVM_NAME.tar.xz               \
    dc13938a604f70379d3b38d09031de98                                                                      \
    downloads                                                                                             \
    $LLVM_NAME.tar.xz
println "llvm/scripts/buildit.sh" "extrating" echo "Extracting tarball"
  pushd_quiet "$UTILS_PATH/toolchain/llvm/downloads"
    println "llvm/scripts/buildit.sh" "extracting" tar -xvJf llvm-project-16.0.6.src.tar.xz
  popd_quiet
println "llvm/scripts/buildit.sh" "Confguring" echo "Configuring LLVM"
  PREFIX=$UTILS_PATH/toolchains/llvm/local/clang
  rm -rf "$PREFIX"
  mkdir -p "$PREFIX"
  mkdir -p "$UTILS_PATH/toolchains/llvm/artifacts"

  pushd_quiet "$UTILS_PATH/toolchains/llvm/artifacts"
    println "llvm/scripts/buildit.sh" "Configuring" cmake "$UTILS_PATH/toolchains/llvm/downloads/$LLVM_NAME"           \
      -G Ninja                                                                                                         \
      -DCMAKE_INSTALL_PREFIX="$PREFIX"                                                                                 \
      -DCMAKE_SYSROOT="$ARTIFACTS_PATH/llvm"                                                                           \
      -C "$UTILS_PATH/toolchains/llvm/config/llvm.cmake"
  popd_quiet
