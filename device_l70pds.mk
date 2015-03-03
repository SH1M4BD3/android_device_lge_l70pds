LOCAL_PATH := device/lge/l70pds

# Ramdisk
PRODUCT_COPY_FILES += \
	   $(LOCAL_PATH)/ramdisk/recovery.fstab:root/recovery.fstab \
	   
# Userdebug 
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1	   

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
