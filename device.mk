#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt6833-common
$(call inherit-product, device/xiaomi/mt6833-common/mt6833.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/everpal/everpal-vendor.mk)

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)-kernel/Image.gz:kernel

# Properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/odm,$(TARGET_COPY_OUT_ODM)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/product,$(TARGET_COPY_OUT_PRODUCT)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/system,$(TARGET_COPY_OUT_SYSTEM)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/system_ext,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/vendor,$(TARGET_COPY_OUT_VENDOR)/etc/properties)

# Recovery
PRODUCT_COPY_FILES += \
    vendor/xiaomi/everpal/proprietary/vendor/firmware/novatek_ts_ct_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_ct_fw.bin \
    vendor/xiaomi/everpal/proprietary/vendor/firmware/novatek_ts_ct_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_ct_mp.bin \
    vendor/xiaomi/everpal/proprietary/vendor/firmware/novatek_ts_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_fw.bin \
    vendor/xiaomi/everpal/proprietary/vendor/firmware/novatek_ts_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_mp.bin

# Rootdir
PRODUCT_PACKAGES += \
    init.mt6833.rc

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.everpal
