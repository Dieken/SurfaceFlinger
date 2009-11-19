add_library(agl
    egl.cpp
    state.cpp
    texture.cpp
    Tokenizer.cpp
    TokenManager.cpp
    TextureObjectManager.cpp
    BufferObjectManager.cpp
    array.cpp
    fp.cpp
    light.cpp
    matrix.cpp
    mipmap.cpp
    primitives.cpp
    vertex.cpp
    )

target_link_libraries(agl pixelflinger)
set_target_properties(agl PROPERTIES
    COMPILE_FLAGS -fvisibility=hidden
    )

