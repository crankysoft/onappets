LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libjpeg-turbo
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libjpeg-turbo.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

include $(PREBUILT_STATIC_LIBRARY)
