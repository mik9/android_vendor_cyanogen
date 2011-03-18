$(call inherit-product, build/target/product/full_base.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Inherit AOSP device configuration for legend.
$(call inherit-product, device/lge/thunderg/device_thunderg.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Include FM-Radio stuff (does not work at this moment)
#$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderg
PRODUCT_MODEL := LG-P500
PRODUCT_MANUFACTURER := LGE
PRODUCT_NAME := cyanogen_thunderg
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=thunderg BUILD_UTC_DATE=0

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers

CYANOGEN_NIGHTLY := true

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-Thuderg-mik
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-Thunderg
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-Thunderg-mik
    endif
endif

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
