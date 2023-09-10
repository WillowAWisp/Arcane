//
// Created by Willow Bracker on 9/10/23.
//

#pragma once

#include "utils/preprocessor_utilities.h"
#include "types/ctypes.h"

extern "C" [[noreturn]] void runit_verify_failed(const char* message);

#define VERIFY(expr) (__builtin_expect(!(expr), 0)                                                       \
  ? runit_verify_failed("VERIFY("#expr") FAILED: [ " __FILE_NAME__ ":" TO_STRING(__LINE__) " ]")         \
  : (void(0)))

#define NOT_REACHED false
#define TODO_ false

#define VERIFY_NOT_REACHED() VERIFY(NOT_REACHED)
#define TODO() VERIFY(TODO_)
