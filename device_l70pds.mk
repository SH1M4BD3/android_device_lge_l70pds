LOCAL_PATH := device/lge/l70pds

# Ramdisk
PRODUCT_COPY_FILES += \
	   $(LOCAL_PATH)/ramdisk/recovery.fstab:root/recovery.fstab \

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/dt.img:dt.img 
    
$(call inherit-product, build/target/product/full.mk)
