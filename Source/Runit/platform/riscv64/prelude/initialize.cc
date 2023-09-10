//
// Created by Willow Bracker on 9/10/23.
//

#include <impl/print_line.h>
#include <impl/verify.h>
#include <hal/csr.h>

int main(int argc, char** argv);

extern "C" [[noreturn]] void _initialize() {
  u64 csr_test = read_csr(0x00000002 /* MSTATUS_SIE */);
  main(0, nullptr);
  VERIFY_NOT_REACHED();
}