add_library(pixelflinger
    codeflinger/ARMAssemblerInterface.cpp
    codeflinger/ARMAssemblerProxy.cpp
    codeflinger/ARMAssembler.cpp
    codeflinger/CodeCache.cpp
    codeflinger/GGLAssembler.cpp
    codeflinger/load_store.cpp
    codeflinger/blending.cpp
    codeflinger/texturing.cpp
    codeflinger/disassem.c
    tinyutils/SharedBuffer.cpp
    tinyutils/VectorImpl.cpp
    fixed.cpp
    picker.cpp
    pixelflinger.cpp
    trap.cpp
    scanline.cpp
    format.cpp
    clear.cpp
    raster.cpp
    buffer.cpp
    )

target_link_libraries(pixelflinger utils)

