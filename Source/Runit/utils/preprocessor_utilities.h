//
// Created by Willow Bracker on 9/10/23.
//

#pragma once

#define TO_STRING_IMPL(str) #str
#define TO_STRING(str) TO_STRING_IMPL(str)

#define JOIN_STRING_IMPL(str0, str1) str0 ## str1
#define JOIN_STRING(str0, str1) JOIN_STRING_IMPL(str0, str1)


