include_directories(../../libs/surfaceflinger)

add_executable(SurfaceFlinger
    main_surfaceflinger.cpp
    )

target_link_libraries(SurfaceFlinger surfaceflinger)

