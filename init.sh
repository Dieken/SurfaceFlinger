#!/bin/sh

lsmod | grep -q uvesafb || modprobe uvesafb
lsmod | grep -q logger || modprobe logger

[ ! -d /dev/log ] && {
    ln /dev/log /dev/log2       # backup this device file
    rm /dev/log
    mkdir /dev/log
    ln /dev/log_main /dev/log/main
    ln /dev/log_events /dev/log/events
    ln /dev/log_radio /dev/log/radio
}

export ANDROID_ROOT=/system

