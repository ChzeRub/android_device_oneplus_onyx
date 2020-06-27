#
# Copyright (C) 2016 The CyanogenMod Project
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

# inherit from Oppo msm8974-common
-include device/oppo/msm8974-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/onyx

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_CONFIG := lineage_onyx_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/onyx

# Assert
TARGET_OTA_ASSERT_DEVICE := onyx,OnePlus,E1003,ONE

# Audio
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user),true)
    ifeq ($(WITH_DEXPREOPT_BOOT_IMG_ONLY),)
      WITH_DEXPREOPT_BOOT_IMG_ONLY := true
    endif
  endif
endif

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12611874816

# Workaround for factory issue
BOARD_VOLD_CRYPTFS_MIGRATE := true

# FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Init
SOONG_CONFIG_OPPO_MSM8974_INIT_DEVICE_LIB := //$(DEVICE_PATH):libinit_onyx

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Protobuf-c
PROTOBUF_SUPPORTED := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# RPC
TARGET_NO_RPC := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# SnapDragon LLVM Compiler
TARGET_USE_SDCLANG := true

-include vendor/oneplus/onyx/BoardConfigVendor.mk
