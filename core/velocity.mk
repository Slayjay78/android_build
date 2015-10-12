# Copyright (C) 2015-2016 Velocity
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

# Strict aliasing
STRICT_ALIASING_FLAGS := \
	-fstrict-aliasing \
	-Wstrict-aliasing \
	-Werror=strict-aliasing

LOCAL_DISABLE_STRICT := \
	sensors.$(TARGET_BOOTLOADER_BOARD_NAME) \
	liblog \
	libziparchive \
	libpdfiumcore \
	libpdfium \
	libbt-brcm_stack \
	mdnsd \
	libwilhelm \
	clatd \
	logd \
	libaudioflinger \
	ping6 \
	libdiskconfig \
	libfdlibm \
	libjavacore \
	libdownmix \
	librtp_jni \
	libldnhncr \
	libvisualizer \
	libqcomvisualizer \
	libuclibcrpc \
	busybox \
	mm-vdec-omx-test \
	
	
ifneq ($(filter $(LOCAL_DISABLE_STRICT),$(LOCAL_MODULE)),)
ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += -fno-strict-aliasing
else
LOCAL_CFLAGS := -fno-strict-aliasing
endif

ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += -fno-strict-aliasing
else
LOCAL_CONLYFLAGS := -fno-strict-aliasing
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += -fno-strict-aliasing
else
LOCAL_CPPFLAGS := -fno-strict-aliasing
endif

ifdef LOCAL_CXXFLAGS
LOCAL_CXXFLAGS += -fno-strict-aliasing
else
LOCAL_CXXFLAGS := -fno-strict-aliasing
endif

else

ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += $(STRICT_ALIASING_FLAGS)
else
LOCAL_CFLAGS := $(STRICT_ALIASING_FLAGS)
endif

ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += $(STRICT_ALIASING_FLAGS)
else
LOCAL_CONLYFLAGS := $(STRICT_ALIASING_FLAGS)
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += $(STRICT_ALIASING_FLAGS)
else
LOCAL_CPPFLAGS := $(STRICT_ALIASING_FLAGS)
endif

ifdef LOCAL_CXXFLAGS
LOCAL_CXXFLAGS += $(STRICT_ALIASING_FLAGS)
else
LOCAL_CXXFLAGS := $(STRICT_ALIASING_FLAGS)
endif
endif

# GCC Only Optimizations
GCC_ONLY_FLAGS := \
	-ftree-vectorize \
	-ftree-loop-distribution \
	-fsched-pressure \
	-fgcse-las \
	-fgcse-sm \
	-funsafe-loop-optimizations \
	-funroll-loops \
	-ftracer \
	-fira-hoist-pressure \
	-fira-loop-pressure
	

ifndef LOCAL_IS_HOST_MODULE
ifeq ($(LOCAL_CLANG),)
LOCAL_DISABLE_GCC := \
	
	
	
ifneq (1,$(words $(filter $(LOCAL_DISABLE_GCC), $(LOCAL_MODULE))))
ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += $(GCC_ONLY_FLAGS)
else
LOCAL_CFLAGS := $(GCC_ONLY_FLAGS)
endif

ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += $(GCC_ONLY_FLAGS)
else
LOCAL_CONLYFLAGS := $(GCC_ONLY_FLAGS)
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += $(GCC_ONLY_FLAGS)
else
LOCAL_CPPFLAGS := $(GCC_ONLY_FLAGS)
endif

ifdef LOCAL_CXXFLAGS
LOCAL_CXXFLAGS += $(GCC_ONLY_FLAGS)	
else
LOCAL_CXXFLAGS := $(GCC_ONLY_FLAGS)
endif

endif
endif
endif

# Fix Segmentation Faults
LOCAL_DISABLE_UNSAFE_MATH_ARM := \
	sensors.$(TARGET_BOOTLOADER_BOARD_NAME) \
	libc_gdtoa \
	libc_dns \
	camera.mako

ifneq ($(filter $(LOCAL_DISABLE_UNSAFE_MATH_ARM),$(LOCAL_MODULE)),)
TARGET_arm_CFLAGS := -fno-unsafe-math-optimizations
endif

LOCAL_DISABLE_OFAST_THUMB := \
	sensors.$(TARGET_BOOTLOADER_BOARD_NAME) \
	libmincrypt \
	libf2fs_fmt \
	libminzip
	

ifneq ($(filter $(LOCAL_DISABLE_OFAST_THUMB),$(LOCAL_MODULE)),)
TARGET_thumb_CFLAGS := -Os
endif

#Performance modules
PERF_MODULES := \
	art \
        libart \
	libart_32 \
        libart-compiler \
	libart-compiler_32 \
        libartd \
	libartd-compiler \
	libart-disassembler \
	libartd-disassembler \
	core.art-host \
	core.art \
	libarttest \
	art-run-tests \
	libart-gtest \
	patchoat \
	dex2oat \
	oatdump \
	libc \
	libc_bionic \
	libc_gdtoa \
	libc_netbsd \
	libc_freebsd \
	libc_dns \
	libc_openbsd \
	libc_cxa \
	libc_syscalls \
	libc_aeabi \
	libc_common \
	libc_malloc \
	libc_nomalloc \
	libc_malloc \
	libc_stack_protector \
	libc_tzcode \
	libc_darwin \
	libc_cxa \
	libstdc++ \
	linker \
	libdl \
	libm \
	libandroid \
	libandroid_runtime \
	libhwui \
	libgui \
	libui \
	libandroidfw \
	libandroidfw_32 \
        libdalvik \
	libjavacore \
	init \
	libbinder \
	libEGL \
	libGLES_trace \
	libGLESv1_CM \
	libGLESv2 \
	libunwind \
	libunwind-ptrace \
	libcrypto \
	librsloader \
	libsurfaceflinger \
	libfilterfw_jni \
	libfilterfw_native \
	librs_jni \
	libskia \
	libutils
	
# Disable Clang 
ifeq (1,$(words $(filter $(PERF_MODULES),$(LOCAL_MODULE))))
WITHOUT_CLANG=true
LOCAL_CLANG=false
endif

# GNU11 Support
ifndef LOCAL_IS_HOST_MODULE
ifneq ($(strip $(LOCAL_CLANG)),true)
LOCAL_DISABLE_C11 := \
	libcutils \
	liblog \
	libaudioutils \
	audio.primary.msm8974 \
	audio.primary.msm8960
	
ifneq (1,$(words $(filter $(LOCAL_DISABLE_C11), $(LOCAL_MODULE))))

ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += -std=gnu11
else
LOCAL_CONLYFLAGS := -std=gnu11
endif


endif
endif
endif

# GNU++11 Support
	
ifeq (1,$(words $(filter $(PERF_MODULES), $(LOCAL_MODULE))))
ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += -std=gnu11
else
LOCAL_CONLYFLAGS := -std=gnu11
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += -std=gnu++11
else
LOCAL_CPPFLAGS := -std=gnu++11
endif
endif

# Arm Optimizations
ifndef LOCAL_IS_HOST_MODULE
ifneq ($(strip $(LOCAL_CLANG)),true)
ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += -marm
else
LOCAL_CFLAGS := -marm
endif

ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += -marm
else
LOCAL_CONLYFLAGS := -marm
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += -marm
else
LOCAL_CPPFLAGS := -marm
endif
endif
endif

# Krait neon opts
NEON_FLAGS := \
	-DQCOM_NEON_OPTIMIZATION \
	-D__ARM_FEATURE_LPAE=1 \
	-D__ARM_FEATURE_VFP4=1 \
	-D__ARM_HAVE_NEON \
	-DUSE_NEON_BITMAP_OPTS \
	-DHARDFLOAT
	

ifndef LOCAL_IS_HOST_MODULE
ifeq ($(LOCAL_CLANG),)
LOCAL_DISABLE_NEON_FLAGS := \
	
	
	
ifneq (1,$(words $(filter $(LOCAL_DISABLE_NEON_FLAGS), $(LOCAL_MODULE))))
ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += $(NEON_FLAGS)
else
LOCAL_CFLAGS := $(NEON_FLAGS)
endif

ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += $(NEON_FLAGS)
else
LOCAL_CONLYFLAGS := $(NEON_FLAGS)
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += $(NEON_FLAGS)
else
LOCAL_CPPFLAGS := $(NEON_FLAGS)
endif

ifdef LOCAL_CXXFLAGS
LOCAL_CXXFLAGS += $(NEON_FLAGS)	
else
LOCAL_CXXFLAGS := $(NEON_FLAGS)
endif

endif
endif
endif

# Graphite Optimizations
GRAPHITE_FLAGS := \
	-fgraphite \
	-fgraphite-identity \
	-floop-flatten \
	-floop-parallelize-all \
	-ftree-loop-linear \
	-floop-interchange \
	-floop-strip-mine \
	-floop-block \
	-floop-nest-optimize

ifndef LOCAL_IS_HOST_MODULE
ifeq ($(LOCAL_CLANG),)
LOCAL_DISABLE_GRAPHITE := \
	sensors.$(TARGET_BOOTLOADER_BOARD_NAME) \
	libFFTEm \
	libmedia_jni \
	libFraunhoferAAC \
	libwebrtc_spl \
	mdnsd
	
ifneq (1,$(words $(filter $(LOCAL_DISABLE_GRAPHITE), $(LOCAL_MODULE))))
ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += $(GRAPHITE_FLAGS)
else
LOCAL_CFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += $(GRAPHITE_FLAGS)
else
LOCAL_CONLYFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += $(GRAPHITE_FLAGS)
else
LOCAL_CPPFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef LOCAL_CXXFLAGS
LOCAL_CXXFLAGS += $(GRAPHITE_FLAGS)
else
LOCAL_CXXFLAGS := $(GRAPHITE_FLAGS)
endif

ifndef LOCAL_LDFLAGS
LOCAL_LDFLAGS  := $(GRAPHITE_FLAGS)
else
LOCAL_LDFLAGS  += $(GRAPHITE_FLAGS)
endif

endif
endif
endif