LOCAL_PATH := $(call my-dir)

MY_CFLAGS := -Wall

include $(CLEAR_VARS)

LOCAL_MODULE := libjpeg-turbo
LOCAL_SRC_FILES := \
src/jaricom.c \
src/jcapimin.c \
src/jcapistd.c \
src/jccoefct.c \
src/jccolor.c \
src/jcdctmgr.c \
src/jchuff.c \
src/jcinit.c \
src/jcmainct.c \
src/jcmarker.c \
src/jcmaster.c \
src/jcomapi.c \
src/jcparam.c \
src/jcphuff.c \
src/jcprepct.c \
src/jcsample.c \
src/jctrans.c \
src/jdapimin.c \
src/jdapistd.c \
src/jdarith.c \
src/jdatadst.c \
src/jdatasrc.c \
src/jdcoefct.c \
src/jdcolor.c \
src/jddctmgr.c \
src/jdhuff.c \
src/jdinput.c \
src/jdmainct.c \
src/jdmarker.c \
src/jdmaster.c \
src/jdmerge.c \
src/jdphuff.c \
src/jdpostct.c \
src/jdsample.c \
src/jdtrans.c \
src/jerror.c \
src/jfdctflt.c \
src/jfdctfst.c \
src/jfdctint.c \
src/jidctflt.c \
src/jidctfst.c \
src/jidctint.c \
src/jidctred.c \
src/jquant1.c \
src/jquant2.c \
src/jutils.c \
src/jmemmgr.c \
src/jmemnobs.c
ifeq ($(TARGET_ARCH),arm)
LOCAL_SRC_FILES += src/simd/jsimd_arm.c src/simd/jsimd_arm_neon.S
else
LOCAL_SRC_FILES += src/jsimd_none.c
endif
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src $(LOCAL_PATH)/include
LOCAL_CFLAGS := $(MY_CFLAGS)
LOCAL_ARM_MODE := arm

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

include $(BUILD_STATIC_LIBRARY)
