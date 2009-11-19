include_directories(${CMAKE_SOURCE_DIR}/external/skia/include/core)

add_executable(BootAnimation
    bootanimation_main.cpp
    BootAnimation.cpp
    )

target_link_libraries(BootAnimation sgl GLESv1_CM)

