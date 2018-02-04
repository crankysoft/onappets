@echo off

set SRC_DIR=libjpeg-turbo
set OUTPUT_TMP_DIR=output
set OUTPUT_SUB_DIR=libjpeg-turbo
set OUTPUT_DIR=%OUTPUT_TMP_DIR%\%OUTPUT_SUB_DIR%

if not exist %SRC_DIR% (
	echo %SRC_DIR% not exist.
	exit /b
)

rmdir /s /q %OUTPUT_TMP_DIR%
mkdir %OUTPUT_TMP_DIR%
mkdir %OUTPUT_TMP_DIR%\%OUTPUT_SUB_DIR%
mkdir %OUTPUT_DIR%\src
mkdir %OUTPUT_DIR%\src\simd
mkdir %OUTPUT_DIR%\include

for %%i in (
%SRC_DIR%\jaricom.c ^
%SRC_DIR%\jcapimin.c ^
%SRC_DIR%\jcapistd.c ^
%SRC_DIR%\jccoefct.c ^
%SRC_DIR%\jccolext.c ^
%SRC_DIR%\jccolor.c ^
%SRC_DIR%\jcdctmgr.c ^
%SRC_DIR%\jchuff.c ^
%SRC_DIR%\jchuff.h ^
%SRC_DIR%\jcinit.c ^
%SRC_DIR%\jcmainct.c ^
%SRC_DIR%\jcmarker.c ^
%SRC_DIR%\jcmaster.c ^
%SRC_DIR%\jcomapi.c ^
%SRC_DIR%\jcparam.c ^
%SRC_DIR%\jcphuff.c ^
%SRC_DIR%\jcprepct.c ^
%SRC_DIR%\jcsample.c ^
%SRC_DIR%\jctrans.c ^
%SRC_DIR%\jdcol565.c ^
%SRC_DIR%\jdapimin.c ^
%SRC_DIR%\jdapistd.c ^
%SRC_DIR%\jdarith.c ^
%SRC_DIR%\jdatadst.c ^
%SRC_DIR%\jdatasrc.c ^
%SRC_DIR%\jdcoefct.c ^
%SRC_DIR%\jdcoefct.h ^
%SRC_DIR%\jdcolor.c ^
%SRC_DIR%\jdcolext.c ^
%SRC_DIR%\jdct.h ^
%SRC_DIR%\jddctmgr.c ^
%SRC_DIR%\jdhuff.c ^
%SRC_DIR%\jdhuff.h ^
%SRC_DIR%\jdinput.c ^
%SRC_DIR%\jdmainct.c ^
%SRC_DIR%\jdmainct.h ^
%SRC_DIR%\jdmarker.c ^
%SRC_DIR%\jdmaster.c ^
%SRC_DIR%\jdmaster.h ^
%SRC_DIR%\jdmerge.c ^
%SRC_DIR%\jdmrg565.c ^
%SRC_DIR%\jdmrgext.c ^
%SRC_DIR%\jdphuff.c ^
%SRC_DIR%\jdpostct.c ^
%SRC_DIR%\jdsample.c ^
%SRC_DIR%\jdsample.h ^
%SRC_DIR%\jdtrans.c ^
%SRC_DIR%\jerror.c ^
%SRC_DIR%\jerror.h ^
%SRC_DIR%\jfdctflt.c ^
%SRC_DIR%\jfdctfst.c ^
%SRC_DIR%\jfdctint.c ^
%SRC_DIR%\jidctflt.c ^
%SRC_DIR%\jidctfst.c ^
%SRC_DIR%\jidctint.c ^
%SRC_DIR%\jidctred.c ^
%SRC_DIR%\jinclude.h ^
%SRC_DIR%\jpeg_nbits_table.h ^
%SRC_DIR%\jpegcomp.h ^
%SRC_DIR%\jpegint.h ^
%SRC_DIR%\jpeglib.h ^
%SRC_DIR%\jquant1.c ^
%SRC_DIR%\jquant2.c ^
%SRC_DIR%\jsimd.h ^
%SRC_DIR%\jsimd_none.c ^
%SRC_DIR%\jsimddct.h ^
%SRC_DIR%\jstdhuff.c ^
%SRC_DIR%\jutils.c ^
%SRC_DIR%\jmemmgr.c ^
%SRC_DIR%\jmemnobs.c ^
%SRC_DIR%\jmemsys.h ^
%SRC_DIR%\jmorecfg.h ^
%SRC_DIR%\jversion.h
) do copy %%i %OUTPUT_DIR%\src

for %%i in (
%SRC_DIR%\simd\jsimd.h ^
%SRC_DIR%\simd\jsimd_arm.c ^
%SRC_DIR%\simd\jsimd_arm_neon.S
) do copy %%i %OUTPUT_DIR%\src\simd

copy jconfig.h %OUTPUT_DIR%\include\jconfig.h
copy jconfigint.h %OUTPUT_DIR%\src\

for %%i in (
%SRC_DIR%\jpeglib.h ^
%SRC_DIR%\jmorecfg.h
) do copy %%i %OUTPUT_DIR%\include

copy Android-source.mk %OUTPUT_DIR%\Android.mk
