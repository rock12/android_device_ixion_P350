# inherit from the proprietary version
-include vendor/ixion/P350/BoardConfigVendor.mk

LOCAL_PATH := device/ixion/P350

# Platform
TARGET_BOARD_PLATFORM := mt6580
TARGET_NO_BOOTLOADER := true

TARGET_LDPRELOAD += libxlog.so:libmtkabi.so

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6580

# Partitions
# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1556925644
BOARD_CACHEIMAGE_PARTITION_SIZE := 251658240
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5583457484
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Kernel
BOARD_KERNEL_CMDLINE += \
	bootopt=64S3,32S1,32S1 \
	androidboot.selinux=disabled

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_MKBOOTIMG_ARGS := \
	--kernel_offset 0x00008000 \
	--ramdisk_offset 0x04000000 \
	--tags_offset 0x0e000000 \
	--board 1441186574

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

BOARD_DONT_USE_MTK_BOOTIMG := true

TARGET_KMODULES := true

COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

TARGET_OTA_ASSERT_DEVICE := "dexp_ixion_p350","P350","DEXP Ixion P350","Ixion P350"

# EGL
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

#BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# RIL
# moved to forked frameworks_opt_telephony repo
#BOARD_RIL_CLASS := ../../../$(DEVICE_FOLDER)/ril/

MTK_CIP_SUPPORT := no
MTK_DT_SUPPORT := no
MTK_UMTS_TDD128_MODE := no
MTK_SHARE_MODEM_CURRENT := 2
MTK_SHARE_MODEM_SUPPORT := 2
MTK_MD_SHUT_DOWN_NT := yes
MTK_FD_SUPPORT := yes
MTK_IPV6_SUPPORT := yes
MTK_LTE_SUPPORT := no
MTK_LTE_DC_SUPPORT := no
MTK_SVLTE_SUPPORT := no
MTK_EAP_SIM_AKA := yes
MTK_DTAG_DUAL_APN_SUPPORT := no
MTK_MD1_SUPPORT = 3
MTK_MD2_SUPPORT = 4
MTK_MD3_SUPPORT = 2
MTK_MD5_SUPPORT = 5
MTK_ENABLE_MD1 = yes
MTK_ENABLE_MD2 = no
MTK_ENABLE_MD3 = no
MTK_ENABLE_MD5 = no
MTK_TC1_FEATURE := no
MTK_SIM_RECOVERY := yes
MTK_SIM_HOT_SWAP_COMMON_SLOT := no
MTK_WORLD_PHONE := no
MTK_VOLTE_SUPPORT := no
MTK_WIFI_CALLING_RIL_SUPPORT := no

COMMON_GLOBAL_CFLAGS += \
	-DMTK_SHARE_MODEM_CURRENT=2 \
	-DMTK_SHARE_MODEM_SUPPORT=2 \
	-DMTK_FD_SUPPORT=1 \
	-DMTK_IPV6_SUPPORT=1 \
	-DMTK_EAP_SIM_AKA=1 \
	-DMTK_MD1_SUPPORT=3 \
	-DMTK_MD2_SUPPORT=4 \
	-DMTK_MD3_SUPPORT=2 \
	-DMTK_MD5_SUPPORT=5 \
	-DMTK_ENABLE_MD1=1 \
	-DMTK_SIM_RECOVERY=1

COMMON_GLOBAL_CPPFLAGS += \
	-DMTK_SHARE_MODEM_CURRENT=2 \
	-DMTK_SHARE_MODEM_SUPPORT=2 \
	-DMTK_FD_SUPPORT=1 \
	-DMTK_IPV6_SUPPORT=1 \
	-DMTK_EAP_SIM_AKA=1 \
	-DMTK_MD1_SUPPORT=3 \
	-DMTK_MD2_SUPPORT=4 \
	-DMTK_MD3_SUPPORT=2 \
	-DMTK_MD5_SUPPORT=5 \
	-DMTK_ENABLE_MD1=1 \
	-DMTK_SIM_RECOVERY=1

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Digital Restrictions Management
MTK_WVDRM_SUPPORT := yes
MTK_WVDRM_L1_SUPPORT := no

# Power and native tap-to-wake
#TARGET_POWERHAL_VARIANT := mtk-xen0n
#TARGET_POWER_SET_FEATURE_LIB := power-feature-xen0n

# system.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/kernel
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file"

ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/root/twrp.fstab
else
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/root/fstab.mt6580
endif

# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
RECOVERY_SDCARD_ON_DATA := true
TW_THEME := portrait_hdpi
DEVICE_RESOLUTION := 720x1280
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_DEFAULT_LANGUAGE := ru
TW_NO_REBOOT_BOOTLOADER := false
TW_NO_USB_STORAGE := false
TW_BRIGHTNESS_PATH := "/sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_L_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone1/temp"
TW_INCLUDE_FB2PNG := true
endif

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file"

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

# NOTE: remove this once Marshmallow kernel is available
POLICYVERS := 29

# Hack for building without kernel sources
ifeq ($(TARGET_DEVICE),P350)
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
endif
