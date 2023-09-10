//
// Created by Willow Bracker on 9/10/23.
//

#include <utils/include_platform.h>

#include PLATFORM_HEADER(print_line.h)

int main(int argc, char** argv) {
  print_line("Runit, march = " TO_STRING(PLATFORM_NAME));
  return 0;
}
