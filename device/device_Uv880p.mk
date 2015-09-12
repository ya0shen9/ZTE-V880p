# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/Uv880p/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_Uv880p
PRODUCT_DEVICE := Uv880p
PRODUCT_MODEL := ZTE Uv880p

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxCore \
    copybit.Uv880p \
    gralloc.Uv880p \
    lights.Uv880p \
    libOmxVidEnc \
    FM \
    abtfilt \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/Uv880p/Uv880p-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/Uv880p/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/Uv880p/prebuilt/usr/keylayout/Uv880p_keypad.kl:system/usr/keylayout/Uv880p_keypad.kl \
    device/zte/Uv880p/prebuilt/usr/keychars/Uv880p_keypad.kcm.bin:system/usr/keychars/Uv880p_keypad.kcm.bin

# Vold
PRODUCT_COPY_FILES += \
    device/zte/Uv880p/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/Uv880p/prebuilt/init.Uv880p.rc:root/init.Uv880p.rc \
    device/zte/Uv880p/prebuilt/ueventd.Uv880p.rc:root/ueventd.Uv880p.rc \
    device/zte/Uv880p/prebuilt/usbconfig:root/sbin/usbconfig

# Audio
PRODUCT_COPY_FILES += \
    device/zte/Uv880p/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT + FM
PRODUCT_COPY_FILES += \
    device/zte/Uv880p/prebuilt/etc/init.bt.sh:system/etc/init.bt.sh \
    device/zte/Uv880p/prebuilt/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/zte/Uv880p/prebuilt/etc/init.wlanprop.sh:system/etc/init.wlanprop.sh \
    device/zte/Uv880p/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/Uv880p/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \

# Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/Uv880p/prebuilt/lib/dhd.ko:system/lib/dhd.ko \
    device/zte/Uv880p/prebuilt/lib/modules/2.6.35.7-perf+/zram.ko:system/lib/modules/2.6.35.7-perf+/zram.ko 

# WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/Uv880p/prebuilt/etc/fw_4330b1.bin:system/etc/fw_4330b1.bin \
    device/zte/Uv880p/prebuilt/etc/fw_4330b2.bin:system/etc/fw_4330b2.bin \
    device/zte/Uv880p/prebuilt/etc/fw_4330_b1_apsta.bin:system/etc/fw_4330_b1_apsta.bin \
    device/zte/Uv880p/prebuilt/etc/fw_4330_b2_apsta.bin:system/etc/fw_4330_b2_apsta.bin \
    device/zte/Uv880p/prebuilt/etc/nv_4330b1.txt:system/etc/nv_4330b1.txt \
    device/zte/Uv880p/prebuilt/etc/nv_4330b1.txt:system/etc/nv_4330b2.txt

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.baseband_version=P736EB01 \
    wifi.supplicant_scan_interval=60 \
    ro.com.android.dataroaming=false

# Uv880p uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

