//
// Created by Willow Bracker on 9/8/23.
//

extern "C" void sbi_console_putchar(int character);

void print_line(const char* message) {
  for (const char* character = message; *character; character++) {
    sbi_console_putchar(*character);
  }
  sbi_console_putchar('\n');
}

extern "C" void runit_prelude() {
  print_line("hello world!");
}
