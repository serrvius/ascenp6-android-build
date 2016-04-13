#
# Copyright 2014 The Android Open-Source Project
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

# Use the non-open-source parts, if they're present
-include vendor/huawei/serrvius/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_BOARD_PLATFORM := k3v2oem1
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
NEED_WORKAROUND_CORTEX_A9_745320 := true
BOARD_VENDOR_PLATFORM := k3v2oem1

#BUILD_ID := serrvius
#BUILD_NUMBER := md.serrvius.201603.v1

TARGET_BOARD_INFO_FILE := device/huawei/serrvius/board-info.txt

TARGET_CPU_SMP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
#EXYNOS4X12_ENHANCEMENTS := true
#EXYNOS4_ENHANCEMENTS := true
#ifdef EXYNOS4X12_ENHANCEMENTS
#COMMON_GLOBAL_CFLAGS += -DEXYNOS4_ENHANCEMENTS
#COMMON_GLOBAL_CFLAGS += -DEXYNOS4X12_ENHANCEMENTS
#COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
#endif


#BOARD_NAND_PAGE_SIZE := 4096
#BOARD_NAND_SPARE_SIZE := 128
#BOARD_FLASH_BLOCK_SIZE := 4096
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := размер_раздела_в_мб*1024*1024
#BOARD_USERDATAIMAGE_PARTITION_SIZE := размер_раздела_в_мб*1024*1024
#TARGET_USERIMAGES_USE_EXT4 := true

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5255462912
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

# Webkit
#ENABLE_WEBGL := true
#TARGET_FORCE_CPU_UPLOAD := true

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_WLAN_DEVICE                := wl12xx_mac80211

#USES_TI_MAC80211 := true
#ifdef USES_TI_MAC80211
#	BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
#	BOARD_HOSTAPD_DRIVER             := NL80211
#	BOARD_WLAN_DEVICE                := wl12xx_mac80211
#	BOARD_SOFTAP_DEVICE              := wl12xx_mac80211
#	WPA_SUPPLICANT_VERSION           := VER_0_8_X_TI
	#WPA_SUPPLICANT_VERSION           := VER_0_8_X
#	BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
#	BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wl12xx
	#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
	#BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
#	PRODUCT_WIRELESS_TOOLS           := true
	#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlcore_sdio.ko"
	#WIFI_DRIVER_MODULE_NAME          := "wlcore_sdio"
#	WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
#	WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
#	WIFI_FIRMWARE_LOADER             := ""
#	COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
#endif

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_WPAN_DEVICE :=true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/serrvius/bluetooth


# Camera
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_CAMERA_ABI_HACK

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage

# Graphics
BOARD_EGL_CFG := device/huawei/serrvius/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true


#TARGET_KERNEL_SOURCE := devices/huawei/serrvius-kernel
#TARGET_KERNEL_CONFIG := hisi_k3v2oem1_defconfig

TARGET_PREBUILT_KERNEL:= device/huawei/serrvius/zImage
#BOARD_KERNEL_CMDLINE := vmalloc=512M k3v2_pmem=1 mmcparts=mmcblk0:p1(xloader),p3(nvme),p4(misc),p5(splash),p6(oeminfo),p7(reserved1),p8(reserved2),p9(splash2),p10(recovery2),p11(recovery),p12(boot),p13(modemimage),p14(modemnvm1),p15(modemnvm2),p16(system),p17(cache),p18(cust),p19(userdata);mmcblk1:p1(ext_sdcard)
BOARD_KERNEL_CMDLINE := k3v2_mem=1048544K@0x40000000 vmalloc=512M k3v2_pmem=1 mmcparts=mmcblk0:p1(xloader),p3(nvme),p4(misc),p5(splash),p6(oeminfo),p7(reserved1),p8(reserved2),p9(splash2),p10(recovery2),p11(recovery),p12(boot),p13(modemimage),p14(modemnvm1),p15(modemnvm2),p16(system),p17(cache),p18(cust),p19(userdata);mmcblk1:p1(ext_sdcard) boardid=0x36200110,0x00000025,0x00000057
#BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_BASE := 0x0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x01400000

# USB mass storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
BOARD_MTP_DEVICE := "/dev/mtp"
BOARD_VOLD_MAX_PARTITIONS := 19
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Recovery
TARGET_RECOVERY_FSTAB := device/huawei/serrvius/fstab.k3v2oem1
#TARGET_RECOVERY_FSTAB := device/huawei/serrvius/recovery/recovery.fstab
BOARD_CUSTOM_RECOVERY_KEYMAPPING := device/huawei/serrvius/recovery/recovery_keys.c
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_TOUCH_RECOVERY :=
#TARGET_RECOVERY_PIXEL_FORMAT := "RGB_8888"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_LOCKED_BOOTLOADER := false
#RECOVERY_FSTAB_VERSION := 2
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERY_SWIPE := true

