#!/bin/sh

#CPPFLAGS="-I system/core/include   -I hardware/libhardware/include   -I hardware/libhardware_legacy/include   -I hardware/ril/include   -I dalvik/libnativehelper/include   -I frameworks/base/include   -I frameworks/base/opengl/include   -I external/skia/include   -I out/debug/target/product/generic/obj/include   -I bionic/libc/arch-arm/include   -I bionic/libc/include   -I bionic/libstdc++/include   -I bionic/libc/kernel/common   -I bionic/libc/kernel/arch-arm   -I bionic/libm/include   -I bionic/libm/include/arch/arm   -I bionic/libthread_db/include  -fno-exceptions -Wno-multichar -msoft-float -fpic -ffunction-sections -funwind-tables -fstack-protector -fno-short-enums -march=armv5te -mtune=xscale  -D__ARM_ARCH_5__ -D__ARM_ARCH_5T__ -D__ARM_ARCH_5TE__ -include system/core/include/arch/linux-arm/AndroidConfig.h -I system/core/include/arch/linux-arm/ -mthumb-interwork -DANDROID -fmessage-length=0 -W -Wall -Wno-unused -Werror=return-type -O0 -g  -mthumb -Os -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -marm -fno-omit-frame-pointer"

CPPFLAGS="-I system/core/include   -I hardware/libhardware/include   -I hardware/libhardware_legacy/include   -I hardware/ril/include   -I dalvik/libnativehelper/include   -I frameworks/base/include   -I frameworks/base/opengl/include   -I external/skia/include   -I tools/include   -I out/host/linux-x86/obj/include   -I cphone/system/core/liblog   -I out/host/linux-x86/obj/STATIC_LIBRARIES/liblog_intermediates  -c -fno-exceptions -Wno-multichar -m32 -fPIC -include system/core/include/arch/linux-x86/AndroidConfig.h -DANDROID -fmessage-length=0 -W -Wall -Wno-unused -O2 -g -fno-strict-aliasing -DNDEBUG -UDEBUG  -DFAKE_LOG_DEVICE=1"

for f in $@; do
    echo "#include <$f>"
done | arm-eabi-gcc -E $CPPFLAGS - |
    grep '^#' |
    cut -d ' ' -f 3 |
    sort -u |
    grep -v '^"\(<\|bionic\)' |
    grep -v "$LOGNAME"'\|AndroidConfig.h\|toolchain' |
    sed 's/"//g'

