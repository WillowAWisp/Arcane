//
// Created by Willow Bracker on 9/10/23.
//

#include "verify.h"
#include "hal/sbi.h"
#include "impl/print_line.h"

void runit_verify_failed(const char* message) {
  print_line(message);
  sbi_shutdown();
}
