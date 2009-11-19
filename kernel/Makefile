EXTRA_CFLAGS := -DCONFIG_ANDROID_PMEM=1

ifneq ($(KERNELRELEASE),)
obj-m := mm/ashmem.o \
		drivers/misc/pmem.o \
		drivers/staging/android/binder.o \
		drivers/staging/android/logger.o
else

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean

endif

