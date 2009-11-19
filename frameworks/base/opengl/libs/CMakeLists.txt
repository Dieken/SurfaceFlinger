add_library(EGL
    EGL/egl.cpp
    EGL/gpu.cpp
    )

target_link_libraries(EGL ui)
set_target_properties(EGL PROPERTIES
    COMPILE_FLAGS -fvisibility=hidden
    )


add_library(GLESv1_CM
    GLES_CM/gl.cpp
    )

target_link_libraries(GLESv1_CM EGL)
set_target_properties(GLESv1_CM PROPERTIES
    COMPILE_FLAGS -fvisibility=hidden
    )

