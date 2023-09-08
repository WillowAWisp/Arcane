#!/usr/bin/env bash

# As with every shell script, include libbuildit

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/libbuildit.sh"

print_help() {
  cat <<EOF
Usage: arcane.sh [COMMAND] [ARGS...]
  Supported TOOLCHAINs: llvm
  Supported COMMANDs:
    toolchain:  Manage the available toolchains.
                ARG1 build or clean, build will create and install while clean will delete
                ARG2 Toolchain, a supported toolchain to build and create.

    help: Print this help screen
          No arguments.
EOF
}

usage() {
  >&2 print_help
  exit 1
}

COMMAND=$1
[ -n "$COMMAND" ] || usage
shift

if [ "$COMMAND" = "toolchain" ]; then
  SUBCOMMAND=$1
  TOOLCHAIN=$2
  shift 2

  if [ "$SUBCOMMAND" == "build" ]; then

    if [ "$TOOLCHAIN" == "llvm" ]; then
      pushd_quiet "$UTILS_PATH/toolchains/llvm"

        if [ $? -ne 0 ]; then
          println "arcane.sh" "toolchain" echo "error, pushd failed, is utils corrupted?"
          exit 1
        fi

        println "arcane.sh" "toolchain" echo "calling buildit..."
        ./scripts/buildit.sh

      popd_quiet
    else
      usage
    fi

  elif [ "$SUBCOMMAND" == "clean" ]; then

    if [ "$TOOLCHAIN" == "llvm" ]; then
      pushd_quiet "$UTILS_PATH/toolchains/llvm"

        if [ $? -ne 0 ]; then
          println "arcane.sh" "toolchain" echo "error pushd failed, is utils corrupted?"
          exit 1
        fi

        println "arcane.sh" "toolchain" echo "calling cleanit..."
        ./scripts/cleanit.sh

      popd_quiet
    else
      usage
    fi

  else
    usage
  fi
fi

if [ "$COMMAND" = "help" ]; then
  print_help
  exit 0
fi
