@echo off

if [%1] == [] goto usage
if [%2] == [] goto usage

set APPLICATION_MK_PATH=%1
set ANDROID_NDK_PATH=%2

set OUTPUT_TMP_DIR=output
set OUTPUT_SUB_DIR=libjpeg-turbo
set OUTPUT_DIR=%OUTPUT_TMP_DIR%\%OUTPUT_SUB_DIR%

if not exist %OUTPUT_DIR% (
	echo Not exist %OUTPUT_DIR%.
	echo Do 'android_source.bat' first.
	eixt /b
)

call %ANDROID_NDK_PATH%\ndk-build ^
NDK_PROJECT_PATH=%OUTPUT_DIR% ^
APP_BUILD_SCRIPT=%OUTPUT_DIR%/Android.mk ^
NDK_APPLICATION_MK=%APPLICATION_MK_PATH%

mkdir %OUTPUT_DIR%\libs

for /d %%i in (%OUTPUT_DIR%\obj\local\*) do (
mkdir %OUTPUT_DIR%\libs\%%~nxi
copy %%i\*.a %OUTPUT_DIR%\libs\%%~nxi
)

rmdir /s /q %OUTPUT_DIR%\src
rmdir /s /q %OUTPUT_DIR%\obj

copy Android-prebuilt.mk %OUTPUT_DIR%\Android.mk
exit /b

:usage
echo Uage: android_prebuilt.bat ^<Application.mk^> ^<Android NDK path^>
echo Example:
echo android_prebuilt.bat Application.mk d:\sdk\android-ndk-r14b
