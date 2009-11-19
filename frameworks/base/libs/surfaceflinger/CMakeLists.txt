add_library(surfaceflinger
    clz.cpp
    DisplayHardware/DisplayHardware.cpp
    DisplayHardware/DisplayHardwareBase.cpp
    GPUHardware/GPUHardware.cpp
    BlurFilter.cpp
    CPUGauge.cpp
    Layer.cpp
    LayerBase.cpp
    LayerBuffer.cpp
    LayerBlur.cpp
    LayerBitmap.cpp
    LayerDim.cpp
    LayerOrientationAnim.cpp
    OrientationAnimation.cpp
    SurfaceFlinger.cpp
    Tokenizer.cpp
    Transform.cpp
    VRamHeap.cpp
    )

target_link_libraries(surfaceflinger GLESv1_CM)

