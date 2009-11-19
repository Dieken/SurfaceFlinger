# See
# http://www.itk.org/Wiki/CMake_Useful_Variables

cmake_minimum_required(VERSION 2.6 FATAL_ERROR)
project(Android)


macro(set_if_not_defined var value)
    if(NOT DEFINED ${var})
        set(${var} ${value})
    endif()
endmacro()

set_if_not_defined(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
set_if_not_defined(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)
set_if_not_defined(BUILD_SHARED_LIBS ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_INCLUDE_DIRECTORIES_PROJECT_BEFORE ON)

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--no-undefined -pthread")


include_directories(
    system/core/include
    hardware/libhardware/include
    hardware/libhardware_legacy/include
    hardware/ril/include
    dalvik/libnativehelper/include
    frameworks/base/include
    frameworks/base/opengl/include
    external/skia/include
    #bionic/libc/include
    #bionic/libstdc++/include
    bionic/libc/kernel/common
    bionic/libc/kernel/arch-x86
    #bionic/libm/include
    #bionic/libm/include/arch/x86
    #bionic/libthread_db/include
    )

#link_directories(.....)

add_definitions(
    -fno-exceptions
    -Wno-multichar
    -m32
    -include ${CMAKE_SOURCE_DIR}/system/core/include/arch/linux-x86/AndroidConfig.h
    -DANDROID
    -fmessage-length=0
    -W
    -Wall
    -Wno-unused
    -fno-strict-aliasing
    -pthread
    )

add_subdirectory(system/core/liblog)
add_subdirectory(system/core/libcutils)
add_subdirectory(frameworks/base/libs/utils)
add_subdirectory(frameworks/opt/emoji)
add_subdirectory(external/skia)
add_subdirectory(hardware/libhardware)
add_subdirectory(hardware/libhardware_legacy)
add_subdirectory(system/core/libpixelflinger)
add_subdirectory(frameworks/base/libs/ui)
add_subdirectory(frameworks/base/opengl/libs)
add_subdirectory(frameworks/base/opengl/libagl)
add_subdirectory(frameworks/base/libs/surfaceflinger)
add_subdirectory(frameworks/base/cmds/surfaceflinger)
add_subdirectory(frameworks/base/cmds/bootanimation)
add_subdirectory(frameworks/base/cmds/servicemanager)
add_subdirectory(system/core/logcat)
#add_subdirectory(system/core/adb)

