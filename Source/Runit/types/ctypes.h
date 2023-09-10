//
// Created by Willow Bracker on 9/10/23.
//

#pragma once

namespace Runit {
  using u64 = __UINT64_TYPE__;
  using u32 = __UINT32_TYPE__;
  using u16 = __UINT16_TYPE__;
  using u8 = __UINT8_TYPE__;

  using i64 = __INT64_TYPE__;
  using i32 = __INT32_TYPE__;
  using i16 = __INT16_TYPE__;
  using i8 = __INT8_TYPE__;

  using FlatPtr = unsigned long*;
  using FlatAddress = unsigned long;

  using NULLPTR_T = decltype(nullptr);
}

using Runit::u64;
using Runit::u32;
using Runit::u16;
using Runit::u8;

using Runit::i64;
using Runit::i32;
using Runit::i16;
using Runit::i8;

using Runit::FlatPtr;
using Runit::FlatAddress;

using Runit::NULLPTR_T;
