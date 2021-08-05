# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 20)


# initalize pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "/home/vasu/Documents/projects/pico/getting_started/pico-sdk")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(ADC C CXX ASM)

set(PICO_CXX_ENABLE_RTTI 1)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

if(PICO_ON_DEVICE)
    message(STATUS "Configuring for PICO")
else()
    message(STATUS "Configuring for HOST")
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Add executable. Default name is the project name, version 0.1

add_executable(ADC ADC.cpp mcp356x.h bit_utils.h magic_enum.hpp)

pico_set_program_name(ADC "ADC")
pico_set_program_version(ADC "0.1")

pico_enable_stdio_uart(ADC 1)
pico_enable_stdio_usb(ADC 0)

# Add the standard library to the build
target_link_libraries(ADC pico_stdlib)

# Add any common user requested libraries
# target_link_libraries(ADC
#     )

# Add any device-specific libraries
if(PICO_ON_DEVICE)
    target_link_libraries(ADC
            hardware_spi
            hardware_pwm
            hardware_clocks
            hardware_structs
        )
    pico_set_float_implementation(ADC pico)
    pico_set_double_implementation(ADC pico)
endif()

pico_add_extra_outputs(ADC)

if (NOT PICO_ON_DEVICE)
    enable_testing()
    include(GoogleTest)

    add_executable(mcp356x_test magic_enum.hpp mcp356x.h bit_utils.h mcp356x_test.cpp)
    target_link_libraries(mcp356x_test gtest gtest_main pthread)

    gtest_discover_tests(mcp356x_test)
endif()
