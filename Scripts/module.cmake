include(ExternalProject)

function(arcane_component project toolchain)
  # this is super hacky, get the arch by making toolchain into a temporary list, then take the 2nd item in it
  string(REPLACE "-" ";" ARCH_NAME "${toolchain}")
  list(GET ARCH_NAME 1 ARCH_NAME)

  set(TOOLCHAIN_FILE ${CMAKE_CURRENT_LIST_DIR}/Scripts/toolchains/${toolchain}.cmake)
  set(OUTPUT_PATH ${ARCANE_ARTIFACTS_PATH}/${ARCH_NAME}/${project})

  ExternalProject_Add(
    ${project}
    PREFIX ${OUTPUT_PATH}
    SOURCE_DIR ${CMAKE_SOURCE_DIR}/Source/${project}
    BINARY_DIR ${OUTPUT_PATH}
    CMAKE_GENERATOR ${ARCANE_COMPONENT_SCRIPT_TYPE}
    CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE} -DARCANE_PATH=${CMAKE_SOURCE_DIR}
    BUILD_COMMAND ${ARCANE_COMPONENT_SCRIPT_CMD}
    INSTALL_COMMAND ""
    BUILD_ALWAYS
  )
endfunction()
