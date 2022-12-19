cmake_minimum_required(VERSION 3.23)
project(test_library)

set(CMAKE_CXX_STANDARD 14)

add_compile_options(-fms-extensions)
# add_compile_options(-fPIC) # あってもよし
add_library(TestLibrary SHARED cpplib/TestLibrary.cpp cpplib/TestLibrary.h) # dynamic lib
# add_library(TestLibrary STATIC cpplib/TestLibrary.cpp cpplib/TestLibrary.h) # static lib