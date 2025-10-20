# Copyright 2017 The Android Open Source Project
# Licensed under the Apache License, Version 2.0

# ─────────────────────────────────────────────────────────────
# Device architecture
# ─────────────────────────────────────────────────────────────
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

BOARD_SYSTEMSDK_VERSIONS := 31

# ─────────────────────────────────────────────────────────────
# Bootloader / platform
# ─────────────────────────────────────────────────────────────
TARGET_NO_BOOTLOADER := false
TARGET_USES_UEFI := true
TARGET_USES_REMOTEPROC := true

# OTA device assert (use real codename(s))
TARGET_OTA_ASSERT_DEVICE := OP6131L1

# ─────────────────────────────────────────────────────────────
# Kernel / boot images (hdr v4 → vendor_boot device)
# ─────────────────────────────────────────────────────────────
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

# We use vendor_boot; keep kernel out of recovery ramdisk
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_RAMDISK_USE_LZ4 := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# ─────────────────────────────────────────────────────────────
# Partitions & filesystems
# ─────────────────────────────────────────────────────────────
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 233871900672
BOARD_PERSISTIMAGE_PARTITION_SIZE := 67108864
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Dynamic/Logical Super
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
# group size must be (SUPER - 4MiB)
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm odm

# Some trees require this to avoid vendor copy-to-recovery issues
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_VENDOR_DLKMIMAGE := true
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

# ─────────────────────────────────────────────────────────────
# AVB for recovery
# ─────────────────────────────────────────────────────────────
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# ─────────────────────────────────────────────────────────────
# Encryption / security patches (engineering values for recovery)
# ─────────────────────────────────────────────────────────────
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# ─────────────────────────────────────────────────────────────
# Props
# ─────────────────────────────────────────────────────────────
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# ─────────────────────────────────────────────────────────────
# Build system “broken” toggles (keep minimal)
# ─────────────────────────────────────────────────────────────
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN SDCLANG_AE_CONFIG SDCLANG_CONFIG SDCLANG_SA_ENABLE
BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# ─────────────────────────────────────────────────────────────
# Recovery specific (TWRP/OrangeFox compatible)
# ─────────────────────────────────────────────────────────────
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_QCOM_ATS_OFFSET := 1666528204500
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_SUPPORT_INPUT_AIDL_HAPTICS := true

# Theme selection (fixes “Could not find ui.xml”)
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2400
# (No need to set TW_THEME explicitly when using width/height)

# Libraries to embed into recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    libdebuggerd_client

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdebuggerd_client.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so

# Optionally load vendor modules (only if they truly exist on your device)
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko rproc_qcom_common.ko q6_dlkm.ko qcom_q6v5.ko qcom_q6v5_pas.ko qcom_esoc.ko qcom_sysmon.ko qcom-hv-haptics.ko"
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# Use mke2fs for ext4 images
TARGET_USES_MKE2FS := true

# Logging / debug
TARGET_USES_LOGD := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd strace
RECOVERY_BINARY_SOURCE_FILES += \
    $(TARGET_OUT_EXECUTIVES)/debuggerd \
    $(TARGET_OUT_EXECUTIVES)/strace

# ─────────────────────────────────────────────────────────────
# OrangeFox flags (current, non-obsolete)
# ─────────────────────────────────────────────────────────────
# Maintainer name (use OF_MAINTAINER, not FOX_MAINTAINER)
OF_MAINTAINER := killshotxd
# Optional maintainer patch suffix (eg, “_01”)
# export FOX_MAINTAINER_PATCH_VERSION via env if you want a suffix

# Screen / status bar
OF_SCREEN_W := 1080
OF_SCREEN_H := 2400
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1
OF_ALLOW_DISABLE_NAVBAR := 0

# Paths & misc
OF_BRIGHTNESS_PATH := "/sys/devices/platform/soc/ae00000.qcom,mdss_mdp/backlight/panel0-backlight/brightness"
OF_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone45/temp"

# Flashlight (use documented vars)
OF_FLASHLIGHT_ENABLE := 1
OF_FL_PATH1 := "/sys/class/leds/led:torch_0"
# OF_FL_PATH2 := "/sys/class/leds/led:torch_1"    # (uncomment if you need a 2nd path)

# Partitions / treble checks
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

# Decryption / AVB (current behavior is to keep; don’t force-disable)
OF_DONT_PATCH_ENCRYPTED_DEVICE := 1
OF_KEEP_DM_VERITY := 1
OF_KEEP_FORCED_ENCRYPTION := 1
OF_PATCH_AVB20 := 1

# MagiskBoot usage is automatic in current trees; safe to keep explicit
OF_USE_MAGISKBOOT := 1
OF_USE_MAGISKBOOT_FOR_ALL_PATCHES := 1

# OTA defaults
OF_DISABLE_MIUI_OTA_BY_DEFAULT := 1

# Features / quality of life
OF_SUPPORT_ALL_LANGUAGES := 1
OF_USE_GREEN_LED := 0
OF_QUICK_BACKUP_LIST := "/boot;/data;/system;/vendor;"  # must end with a semicolon
OF_DEFAULT_TIMEZONE := "Asia/Kolkata"
OF_RUN_POST_FORMAT_PROCESS := 1

# Extra binaries (watch your ramdisk size)
FOX_USE_NANO_EDITOR := 1
FOX_USE_TAR_BINARY := 1
FOX_USE_PIGZ_BINARY := 1
FOX_REPLACE_TOOLBOX_GETPROP := 1

# APEX/exfat fuse flags (mapped from your earlier TWRP choices)
OF_EXCLUDE_APEX := 1
OF_NO_EXFAT_FUSE := 1
OF_INCLUDE_RESETPROP := 1
OF_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := 1

# Logcat in recovery
OF_USE_LOGD := 1
OF_INCLUDE_LOGCAT := 1

# TWRP specific build flags
TW_FRAMERATE := 120
TW_MAX_BRIGHTNESS := 550

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true


# ─────────────────────────────────────────────────────────────
# Local-only: include OrangeFox installer if present
# ─────────────────────────────────────────────────────────────
ifneq ($(wildcard bootable/recovery/installer/.),)
  USE_RECOVERY_INSTALLER := true
  RECOVERY_INSTALLER_PATH := bootable/recovery/installer
endif
