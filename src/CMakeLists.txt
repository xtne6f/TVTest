cmake_minimum_required(VERSION 3.8)

if(NOT NOMAKE_LIBISDB)
  add_subdirectory(LibISDB)
endif()
add_subdirectory(TVTest_Image)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-s,--dynamicbase,--nxcompat -municode")

project(TVTest CXX)

add_executable(${PROJECT_NAME} WIN32
  Accelerator.cpp
  Aero.cpp
  AppCommand.cpp
  AppCore.cpp
  AppEvent.cpp
  AppUtil.cpp
  AudioManager.cpp
  AudioOptions.cpp
  BasicWindow.cpp
  CaptionPanel.cpp
  Capture.cpp
  CaptureOptions.cpp
  ChannelInput.cpp
  ColorSchemeOptions.cpp
  ComUtility.cpp
  DirectWrite.cpp
  DirectWriteOptionsDialog.cpp
  DPIUtil.cpp
  Epg.cpp
  EpgDataStore.cpp
  GUIUtil.cpp
  MainDisplay.cpp
  MainPanel.cpp
  PathUtil.cpp
  ProgramGuideTool.cpp
  SharedMemory.cpp
  StyleUtil.cpp
  TaskbarOptions.cpp
  TaskbarSharedProperties.cpp
  TextDraw.cpp
  TextDrawClient.cpp
  ThemeDraw.cpp
  TSProcessorErrorDialog.cpp
  EpgCapture.cpp
  ListView.cpp
  NetworkDefinition.cpp
  ChannelHistory.cpp
  ChannelList.cpp
  ChannelManager.cpp
  ChannelPanel.cpp
  ChannelScan.cpp
  ColorPalette.cpp
  ColorScheme.cpp
  Command.cpp
  CommandLine.cpp
  Controller.cpp
  ControlPanel.cpp
  ControlPanelItems.cpp
  CoreEngine.cpp
  DebugHelper.cpp
  Dialog.cpp
  DialogUtil.cpp
  ChannelDisplay.cpp
  DrawUtil.cpp
  DriverManager.cpp
  DriverOptions.cpp
  EpgChannelSettings.cpp
  EpgDataLoader.cpp
  EpgOptions.cpp
  EpgUtil.cpp
  EventInfoPopup.cpp
  EventInfoUtil.cpp
  Favorites.cpp
  FeaturedEvents.cpp
  GeneralOptions.cpp
  Graphics.cpp
  Help.cpp
  HomeDisplay.cpp
  Image.cpp
  InformationPanel.cpp
  IniFile.cpp
  InitialSettings.cpp
  KeywordSearch.cpp
  Layout.cpp
  Logger.cpp
  LogoManager.cpp
  MainWindow.cpp
  Menu.cpp
  MenuOptions.cpp
  MessageDialog.cpp
  AboutDialog.cpp
  NotificationBar.cpp
  OperationOptions.cpp
  OptionDialog.cpp
  Options.cpp
  OSDManager.cpp
  OSDOptions.cpp
  PanAndScanOptions.cpp
  Panel.cpp
  PanelForm.cpp
  PanelOptions.cpp
  PlaybackOptions.cpp
  Plugin.cpp
  ProgramGuide.cpp
  ProgramGuideFavorites.cpp
  ProgramGuideOptions.cpp
  ProgramGuideToolbarOptions.cpp
  ProgramListPanel.cpp
  ProgramSearch.cpp
  PseudoOSD.cpp
  RawInput.cpp
  Record.cpp
  RecordOptions.cpp
  RegExp.cpp
  TaskTray.cpp
  RichEditUtil.cpp
  Settings.cpp
  SideBar.cpp
  SideBarOptions.cpp
  StatusItems.cpp
  StatusOptions.cpp
  StatusView.cpp
  stdafx.cpp
  StreamInfo.cpp
  StringUtility.cpp
  Style.cpp
  Taskbar.cpp
  Theme.cpp
  ThemeManager.cpp
  TitleBar.cpp
  Tooltip.cpp
  TSProcessor.cpp
  TSProcessorManager.cpp
  TSProcessorOptions.cpp
  TVTest.cpp
  AppMain.cpp
  UIBase.cpp
  UICore.cpp
  UISkin.cpp
  Util.cpp
  VariableManager.cpp
  VariableString.cpp
  VideoDecoderOptions.cpp
  VideoOptions.cpp
  View.cpp
  ViewOptions.cpp
  WheelCommand.cpp
  WindowUtil.cpp
  ZoomOptions.cpp
  TVTest.rc
)

if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16)
  target_precompile_headers(${PROJECT_NAME} PRIVATE stdafx.h)
endif()
target_compile_options(${PROJECT_NAME} PRIVATE -msse -msse2)
target_compile_definitions(${PROJECT_NAME} PRIVATE _FILE_OFFSET_BITS=64 _UNICODE UNICODE _WINDOWS)
target_include_directories(${PROJECT_NAME} PRIVATE Include Resource LibISDB/Thirdparty/BaseClasses)
if(NOMAKE_LIBISDB)
  target_link_directories(${PROJECT_NAME} PRIVATE LibISDB/build/LibISDB LibISDB/build/LibISDB/Windows)
endif()
target_link_libraries(${PROJECT_NAME} -static-libgcc -static-libstdc++ LibISDBWindows LibISDB BaseClasses liba52 libfaad libmad dwmapi uxtheme gdiplus imm32 quartz comctl32 shlwapi winmm strmiids evr mf mfplat d3d9 dxva2 mfuuid)
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)

add_custom_target(TVTestVersionHash COMMAND ./tvtestversionhashgen.sh WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")
if(GEN_TVTEST_VERSION_HASH)
  add_dependencies(${PROJECT_NAME} TVTestVersionHash)
endif()

add_custom_target(cp_dep ALL
  COMMAND cp -n "$ENV{MINGW_PREFIX}/bin/libwinpthread-1.dll" .
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)
