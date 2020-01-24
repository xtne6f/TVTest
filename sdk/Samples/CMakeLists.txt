cmake_minimum_required(VERSION 3.8)

project(Samples LANGUAGES C CXX)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}" CACHE PATH "Install path prefix." FORCE)
endif()

add_subdirectory(AutoSnapShot)
add_subdirectory(DiskRelay)
add_subdirectory(Equalizer)
add_subdirectory(GamePad)
add_subdirectory(HDUSRemocon)
add_subdirectory(LogoList)
add_subdirectory(MemoryCapture)
add_subdirectory(MiniProgramGuide)
add_subdirectory(PacketCounter)
add_subdirectory(SignalGraph)
add_subdirectory(SleepTimer)
add_subdirectory(SpectrumAnalyzer)
add_subdirectory(TSInfo)
add_subdirectory(TunerPanel)
