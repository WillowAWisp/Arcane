//
// Created by Willow Bracker on 9/10/23.
//

#pragma once
#include <utils/preprocessor_utilities.h>

#define PLATFORM_HEADER(header) TO_STRING(platform/PLATFORM_NAME/impl/header)
