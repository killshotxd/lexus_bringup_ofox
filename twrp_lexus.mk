# 64-bit base
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Omni common
$(call inherit-product, build/core/config/common.mk)

PRODUCT_DEVICE := lexus
PRODUCT_NAME := omni_lexus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus lexus
PRODUCT_MANUFACTURER := OnePlus

# A/B & fastbootd
PRODUCT_PACKAGES +=     fastbootd     android.hardware.fastboot@1.1-impl-mock     android.hardware.fastboot-service.example_recovery

# Bootctl / update engine
PRODUCT_PACKAGES +=     android.hardware.boot@1.0-impl     android.hardware.boot@1.0-service     bootctrl.pineapple     otapreopt_script     cppreopts.sh     update_engine     update_verifier     update_engine_sideload

# Health HAL for recovery
PRODUCT_PACKAGES +=     android.hardware.health@2.1-impl     android.hardware.health@2.1-service

# Crypto
PRODUCT_PACKAGES +=     qcom_decrypt     qcom_decrypt_fbe

# APEX & fs utilities
PRODUCT_PACKAGES +=     e2fsck     mke2fs     tune2fs     resize2fs     toybox_vendor

# Properties to keep vold happy in recovery
PRODUCT_PROPERTY_OVERRIDES +=     ro.secure=0     ro.adb.secure=0     ro.debuggable=1     persist.sys.usb.config=adb
