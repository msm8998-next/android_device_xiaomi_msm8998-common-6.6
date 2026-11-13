#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PLATFORM_PATH := device/xiaomi/msm8998-common

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_CONFIG := vendor/sagit_defconfig
TARGET_KERNEL_ADDITIONAL_FLAGS += KCFLAGS=-Wno-error
TARGET_KERNEL_CONFIG_EXT := \
    kernel/mainline/configs/fragments/android-base-pre/common.config \
    kernel/mainline/configs/fragments/android-base-pre/arm64.config \
    kernel/configs/v/android-6.6/android-base.config \
    kernel/mainline/configs/fragments/android-base-conditional/CONFIG_ARM64-y.config \
    kernel/mainline/configs/fragments/common.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config
TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8998
TARGET_KERNEL_VERSION := 6.6

BOARD_KERNEL_CMDLINE := androidboot.console=ttyMSM0 console=ttyMSM0,115200n8 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/1da4000.ufshc
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware/
BOARD_KERNEL_CMDLINE += clk_ignore_unused
BOARD_KERNEL_CMDLINE += log_buf_len=4M printk.devkmsg=on
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive audit=0

# Platform
TARGET_BOARD_PLATFORM := msm8998
TARGET_ENFORCES_QSSI := true

# A/B
AB_OTA_UPDATER := false

# Assert
TARGET_BOARD_INFO_FILE := $(PLATFORM_PATH)/board-info.txt

# Audio
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
BOARD_USES_ALSA_AUDIO := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(PLATFORM_PATH)/config.fs

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(PLATFORM_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix_legacy.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/xiaomi/vintf/xiaomi_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml

# Graphics (Mesa)
BOARD_MESA3D_USES_MESON_BUILD := true
BOARD_MESA3D_GALLIUM_DRIVERS += freedreno
BOARD_MESA3D_VULKAN_DRIVERS += freedreno
BOARD_MESA3D_BUILD_LIBGBM := true
BOARD_MESA3D_MESON_ARGS += \
    -Dprecomp-compiler=system \
    -Dmesa-clc=system \
    -Dspirv-tools=disabled

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_EROFS_COMPRESSOR := lz4
BOARD_EROFS_PCLUSTER_SIZE := 262144
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_PRODUCT_PROP += $(PLATFORM_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(PLATFORM_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(PLATFORM_PATH)/vendor.prop

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := false
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_UI_BLANK_UNBLANK_ON_INIT := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_xiaomi
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2026-02-05

# SELinux
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/private
PRODUCT_PUBLIC_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/public

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Verity
# Only needed for signing
BOARD_AVB_ENABLE := false

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from proprietary files
include vendor/xiaomi/msm8998-common/BoardConfigVendor.mk
