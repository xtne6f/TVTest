cmake_minimum_required(VERSION 3.8)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-s,--dynamicbase,--nxcompat,--kill-at")

project(SpectrumAnalyzer LANGUAGES C CXX)

add_library(${PROJECT_NAME} SHARED
  fft4g.c
  SpectrumAnalyzer.cpp
  SpectrumAnalyzer.rc
)

target_compile_definitions(${PROJECT_NAME} PRIVATE _UNICODE UNICODE)
target_include_directories(${PROJECT_NAME} PRIVATE ../..)
target_link_libraries(${PROJECT_NAME} -static-libgcc -static-libstdc++ gdiplus shlwapi)
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".tvtp")
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin/Plugins)
