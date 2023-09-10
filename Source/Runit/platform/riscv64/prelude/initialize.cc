//
// Created by Willow Bracker on 9/10/23.
//

#include <impl/verify.h>

int main(int argc, char** argv);

extern "C" [[noreturn]] void _initialize() {
  main(0, nullptr);
  VERIFY_NOT_REACHED();
}