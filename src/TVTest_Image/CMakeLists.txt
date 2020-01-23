cmake_minimum_required(VERSION 3.8)

add_subdirectory(libjpeg)
add_subdirectory(libpng)
add_subdirectory(zlib)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-s,--dynamicbase,--nxcompat,--kill-at")

project(ImageLib CXX)

add_library(${PROJECT_NAME} STATIC
  Codec_BMP.cpp
  Codec_JPEG.cpp
  Codec_PNG.cpp
  ImageLib.cpp
  ImageUtil.cpp
)

target_compile_definitions(${PROJECT_NAME} PRIVATE _UNICODE UNICODE)
target_include_directories(${PROJECT_NAME} PRIVATE zlib)

project(TVTest_Image CXX)

add_library(${PROJECT_NAME} SHARED
  TVTest_Image.cpp
)

target_compile_definitions(${PROJECT_NAME} PRIVATE _UNICODE UNICODE)
target_include_directories(${PROJECT_NAME} PRIVATE zlib)
target_link_libraries(${PROJECT_NAME} -static-libgcc -static-libstdc++ ImageLib libjpeg libpng zlib)
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)
