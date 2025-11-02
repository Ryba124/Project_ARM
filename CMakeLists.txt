cmake_minimum_required(VERSION 3.15)

# Project name and language
project(MyARMProject LANGUAGES C CXX)

# Specify the target architecture (e.g., ARM Cortex-A)
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
include_directories(C:/CMSIS/CMSIS_6-6.1.0/CMSIS/Core/Include/)

add_executable(Firmware.exe 
main.cpp
startup_R7FA4M1AB.c
system_R7FA4M1AB.c
)