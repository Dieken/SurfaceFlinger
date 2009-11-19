add_library(ui
    Camera.cpp
    CameraParameters.cpp
    EGLDisplaySurface.cpp
    EGLNativeWindowSurface.cpp
    EventHub.cpp
    EventRecurrence.cpp
    KeyLayoutMap.cpp
    KeyCharacterMap.cpp
    ICamera.cpp
    ICameraClient.cpp
    ICameraService.cpp
    IOverlay.cpp
    ISurfaceComposer.cpp
    ISurface.cpp
    ISurfaceFlingerClient.cpp
    LayerState.cpp
    Overlay.cpp
    PixelFormat.cpp
    Rect.cpp
    Region.cpp
    Surface.cpp
    SurfaceComposerClient.cpp
    SurfaceFlingerSynchro.cpp
    )

target_link_libraries(ui corecg pixelflinger hardware hardware_legacy)

