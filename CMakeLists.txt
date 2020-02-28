cmake_minimum_required(VERSION 2.8.3)
project(ergodic_iSAC_exploration)

add_definitions(-O2)

find_package(Eigen3 REQUIRED)
include_directories(${Eigen3_INCLUDE_DIRS})

include_directories(user src)

file(GLOB SOURCES "Quad_euler.cpp")

add_executable(Quad_euler ${SOURCES})