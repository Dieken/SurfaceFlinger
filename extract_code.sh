#!/bin/bash

[ -z "$ANDROID_BUILD_TOP" ] && ANDROID_BUILD_TOP=$HOME/android
ANDROID_BUILD_TOP=${ANDROID_BUILD_TOP%/}
[ -e "$ANDROID_BUILD_TOP/.repo" ] || {
    echo "$ANDROID_BUILD_TOP/.repo not found, where is your android code?"
    exit 1
}

TMP_VERSIONS=versions.$$

cleanup () {
    echo -e "\nversions:\n"
    sort -k 2 -u $TMP_VERSIONS
    rm $TMP_VERSIONS
}

find_dir () {
    local d=$1
    local dir=$(pwd)

    while [ -n "$dir" ]; do
        [ -d "$dir/$d" ] && break
        dir=$(dirname "$dir")
        [ "$dir" = "/" ] && dir= && break
    done

    echo "$dir"
}

get_module_version () {
    local d=$1
    local module

    [ -d "$1" ] || d=$(dirname "$1")
    d="$ANDROID_BUILD_TOP/$d"
    module=$(cd "$d"; find_dir .git)
    module=${module#$ANDROID_BUILD_TOP/}

    [ -z "$module" ] && return
    echo $(cd "$d"; git rev-parse HEAD) " $module"
}

copy_source () {
    #tar -exclude .git -C $ANDROID_BUILD_TOP -cf - $1 | tar -xf -
    mkdir -p `dirname $1`
    if [ -d $ANDROID_BUILD_TOP/$1 ]; then
        rsync -a --exclude .git $ANDROID_BUILD_TOP/$1/ $1
    else
        rsync -a --exclude .git $ANDROID_BUILD_TOP/$1 $1
    fi

    get_module_version "$1" >> $TMP_VERSIONS
}

trap cleanup EXIT

copy_source system/core/include
copy_source hardware/libhardware/include
copy_source hardware/libhardware_legacy/include
copy_source hardware/ril/include
copy_source dalvik/libnativehelper/include
copy_source frameworks/base/include
copy_source frameworks/base/opengl/include
copy_source external/skia

copy_source system/core/liblog
copy_source system/core/libcutils
copy_source frameworks/base/libs/utils
copy_source frameworks/opt/emoji
copy_source frameworks/base/libs/ui
copy_source hardware/libhardware
copy_source hardware/libhardware_legacy
copy_source system/core/libpixelflinger
copy_source frameworks/base/opengl/libs
copy_source frameworks/base/opengl/libagl
copy_source frameworks/base/libs/surfaceflinger
copy_source frameworks/base/cmds/surfaceflinger
copy_source frameworks/base/cmds/bootanimation
copy_source frameworks/base/cmds/servicemanager
copy_source system/core/adb
copy_source system/core/logcat

# required by frameworks/base/cmds/bootanimation/BootAnimation.cpp
copy_source frameworks/base/core/res/assets/images/android-logo-mask.png
copy_source frameworks/base/core/res/assets/images/android-logo-shine.png

# required by system/core/libcutils/mspace.c
copy_source bionic/libc/bionic/dlmalloc.c

# required by system/core/libcutils/ashmem-dev.c
copy_source bionic/libc/kernel/common/linux/ashmem.h

# required by frameworks/base/include/private/utils/binder_module.h
copy_source bionic/libc/kernel/common/linux/binder.h

# required by frameworks/base/libs/utils/MemoryHeapBase.cpp
copy_source bionic/libc/kernel/common/linux/android_pmem.h

# required by frameworks/base/libs/ui/EGLDisplaySurface.cpp
copy_source bionic/libc/kernel/common/linux/msm_mdp.h

##  new kernel source
#copy_source kernel/mm/ashmem.c
#copy_source kernel/mm/shmem.c
#copy_source kernel/drivers/misc/pmem.c
#copy_source kernel/drivers/staging/android/binder.c
#copy_source kernel/drivers/staging/android/logger.c
#
#copy_source kernel/include/linux/ashmem.h
#copy_source kernel/include/linux/mm.h
#copy_source kernel/include/linux/android_pmem.h
#copy_source kernel/drivers/staging/android/binder.h
#copy_source kernel/drivers/staging/android/logger.h

[ -e modified_sources.txt ] &&
    while read f ; do
        [ -z "$f" ] && continue
        git checkout -- $f
    done < modified_sources.txt

