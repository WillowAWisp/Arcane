#include "libsbi.h"

void print_line(const char* message) {
  for (const char* character = message; *character; character++) {
    sbi_console_putchar(*character);
  }
  sbi_console_putchar('\n');
}

extern "C" void runit_prelude() {

}
