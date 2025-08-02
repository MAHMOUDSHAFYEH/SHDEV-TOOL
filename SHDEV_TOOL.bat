@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo.
echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║                        SHDEV TOOL 1.0 BETA                            ║
echo ║              CONVERT IMAGES TO BLACK FOR COREL DRAW                  ║
echo ║                    MADE BY MAHMOUD SHAFYEH                           ║
echo ║               © 2025 Mahmoud Shafyeh. All rights reserved.           ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.

REM Set input and output directories
set "INPUT_DIR=INPUT_SH"
set "OUTPUT_DIR=OUTPUT_SH"

REM Check if ImageMagick is available
where magick >nul 2>&1
if errorlevel 1 (
    echo ❌ ImageMagick not found. Make sure it is installed and added to PATH.
    pause
    exit /b
)

REM Check for input directory
if not exist "!INPUT_DIR!" (
    echo ❌ Input folder "!INPUT_DIR!" not found. Please create it and add images inside.
    pause
    exit /b
)

REM Create output directory if not exist
if not exist "!OUTPUT_DIR!" (
    mkdir "!OUTPUT_DIR!"
)

REM Process PNG images from INPUT_SH
for %%f in ("!INPUT_DIR!\*.png") do (
    echo ➤ Processing: %%~nxf
    magick "%%f" -fill black -colorize 100 "!OUTPUT_DIR!\%%~nf_black.png"
)

echo.
echo ✅ Done! Processed images are saved in "!OUTPUT_DIR!" folder.
echo.
echo THANK YOU FOR USING THIS TOOL
echo Please donate to support future updates ❤️
echo Opening donation page...

REM Open the donation page in default browser
start http://yamersal.com/pay/NortnigroupColtd

pause
