source "$UTILS_PATH/libbuildit.sh"

if [ -e "$UTILS_PATH/toolchains/llvm/artifacts" ]; then
  println "llvm/scripts/cleanit.sh" "clean" echo "Removing llvm/artifacts"
  rm -rd "$UTILS_PATH/toolchains/llvm/artifacts"
fi

if [ -e "$UTILS_PATH/toolchains/llvm/downloads" ]; then
  println "llvm/scripts/cleanit.sh" "clean" echo "Removing llvm/downloads"
  rm -rd "$UTILS_PATH/toolchains/llvm/downloads"
fi

if [ -e "$UTILS_PATH/toolchains/llvm/local" ]; then
  println "llvm/scripts/cleanit.sh" "clean" echo "Removing llvm/local"
  rm -rd "$UTILS_PATH/toolchains/llvm/local"
fi
