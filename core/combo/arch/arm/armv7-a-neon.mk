# Configuration for Linux on ARM.
# Generating binaries for the ARMv7-a architecture and higher with NEON
#
ARCH_ARM_HAVE_ARMV7A            := true
ARCH_ARM_HAVE_VFP               := true
ARCH_ARM_HAVE_VFP_D32           := true
ARCH_ARM_HAVE_NEON              := true

arch_variant_cflags += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mvectorize-with-neon-quad -march=armv7-a -mtune=cortex-a53
