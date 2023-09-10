//
// Created by Willow Bracker on 9/10/23.
//

#include "print_line.h"
#include <hal/sbi.h>

void Runit::print_line(const char* message) {
  for (const char* character = message; *character; character++) {
    sbi_console_putchar(*character);
  }
  sbi_console_putchar('\n');
};
