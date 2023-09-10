//
// Created by Willow Bracker on 9/10/23.
//

#include <impl/print_line.h>

int main(int argc, char** argv);

extern "C" [[noreturn]] void _initialize() {
  main(0, (char**)0x0);
  // if we reach this something has gone horribly wrong, just hang
  for (;;) {}
}
