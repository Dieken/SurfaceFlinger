add_library(hardware_legacy
    flashlight/flashlight.c
    gps/gps.cpp
    mount/IMountService.cpp
    power/power.c
    qemu_tracing/qemu_tracing.c
    uevent/uevent.c
    vibrator/vibrator.c
    #wifi/wifi.c
    )

target_link_libraries(hardware_legacy utils)

