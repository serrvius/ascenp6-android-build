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

LOCAL_PATH := device/huawei/serrvius

ifeq ( $(TARGET_PREBUILT_KERNEL), )	
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
else
	LOCAL_KERNEL := device/huawei/serrvius/kernel
endif



PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_LOCALES += en_US

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# This device have enough room for precise davick
PRODUCT_TAGS += dalvik.gc.type-precise

# Prime spacific overrides
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.product.manufacturer=HUAWEI\
#    ro.product.model=P6-U06

# Advanced Settings for Huawei
#PRODUCT_PACKAGES +=\
#	HuaweiParts

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudioutils

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/wifi/p2p_supplicant.conf:/system/etc/wifi/p2p_supplicant.conf
#    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    hostapd.conf

# Misc
PRODUCT_PACKAGES += \
    setup_fs \
    librs_jni \
    libsrec_jni \
    com.android.future.usb.accessory \
    make_ext4fs 

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

PRODUCT_PACKAGES += \
    Torch \
    Stk \
    Launcher2

# Bluetooth & FmRadio
PRODUCT_PACKAGES += \
    uim-sysfs \
    libbt-vendor \
    bt_sco_app \
    BluetoothSCOApp \
    libtinyalsa

# General
PRODUCT_PROPERTY_OVERRIDES := \
    ro.ril.hsxpa=2

# Enable switch storage 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.d/preparesd:/system/etc/init.d/preparesd

# OpenGL ES
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ap.interface=wlan1 \
    ro.config.hw_acceleratord_onoff=1 \
    ro.vold.switchablepair=yes \
    persist.sys.usb.config=mtp,adb \
    ro.opengles.version=131072


# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)


$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/huawei/serrvius/device.mk)



PRODUCT_NAME := full_serrvius
PRODUCT_DEVICE := serrvius
#PRODUCT_BRAND := Android
#PRODUCT_MODEL := serrvius
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Ascend
PRODUCT_MANUFACTURER := huawei
