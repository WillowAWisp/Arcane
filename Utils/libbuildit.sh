#!/usr/bin/env bash

set -e

export PROJECT_PATH

export ARTIFACTS_PATH
export SCRIPTS_PATH
export SOURCE_PATH
export UTILS_PATH

PROJECT_PATH=$( cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.." && pwd )

# Create Arcane/Artifacts if it does not already exist

if [ ! -e "$PROJECT_PATH/Artifacts" ]; then
  mkdir "$PROJECT_PATH/Artifacts"
fi

ARTIFACTS_PATH=$(cd "$PROJECT_PATH/Artifacts" && pwd )
SCRIPTS_PATH=$( cd "$PROJECT_PATH/Scripts" && pwd )
SOURCE_PATH=$( cd "$PROJECT_PATH/Source" && pwd )
UTILS_PATH=$( cd "$PROJECT_PATH/Utils" && pwd )

# pushd_quiet/popd_quiet, pushd/popd but does not output its chdir.

pushd_quiet() {
  pushd "$@" > /dev/null
}

popd_quiet() {
  popd > /dev/null
}

# variables for programs.

SED="sed"

# println, formatted printing

println() {
  FILE=$1
  NAME=$2
  shift 2
  "$@" 2>&1 | "$SED" $'s|^|\e[34m[ '"${FILE} \| ${NAME}"$' ]\e[39m |'
}

# println_ninja, formatted printing for ninja

println_ninja() {
  FILE=$1
  NAME=$2
  shift 2
  env NINJA_STATUS=$'\e[34m[ '"${FILE} \| ${NAME}"$' ]\e[39m [%f/%t] ' "$@"
}

# dependency check, run a command with a message checking for a dependency.

dependency_check() {
  FILE=$1
  NAME=$2
  COMMAND=$3
  shift 3
  println "$FILE" "dependency_check" echo "Checking for $NAME... ($COMMAND)"
  if ! $COMMAND > /dev/null; then
    println "$FILE" "dependency_check" echo "$NAME cannot be run, is it in your path?"
    exit 1
  fi
}

ccld_check() {
  FILE=$1
  PROGRAM=$2
  COMMAND_RESULT=$3
  shift 3
  println "$FILE" "dependency_check" echo "Checking if your $PROGRAM works..."
  if [ $COMMAND_RESULT -ne 0 ]; then
    println "$FILE" "dependency_check" echo "Your tool could not compile a simple test program. (exit code $COMMAND_RESULT)"
  fi
}

# Arg 1, URL
# Arg 2, MD5
# Arg 3, Output Folder.
# Arg 4, File name

download() {
  URL=$1
  MD5=$2
  DEST=$3
  OUTFILE=$4

  if [ ! -e "$DEST" ]; then
    mkdir "$DEST"
  fi

  pushd_quiet "$DEST"
    if [ -e "$OUTFILE" ]; then
        md5sum="$(md5sum ${OUTFILE} | cut -f1 -d' ')"
        echo "llvm md5='$md5sum'"
      fi

      if [ "$md5sum" != "$MD5" ]; then
        rm -f "$OUTFILE"
        curl -LO "$URL"
      else
        echo "Skipped llvm download"
      fi
  popd_quiet
}
