add_library(hardware
    hardware.c
    )

target_link_libraries(hardware cutils dl)

