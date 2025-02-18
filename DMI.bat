@echo off
setlocal enabledelayedexpansion

call warna.bat

set /p model= Silahkan Input Model Product :
set /p sn= Silahkan Input Serial Number :
set "destination=E:\Template Copy Text\PC.txt"

:: Remove quotes from the model input if present
set "model=%model:"=%"

:: Check if the model contains parentheses and handle them
set "model=!model:)=!)"
set "model=!model:(=!"

:: Escape special characters for findstr
set "modelEscaped=%model:-=%%"
set "modelEscaped=%modelEscaped:/=%"
set "modelEscaped=%modelEscaped:(=%"
set "modelEscaped=%modelEscaped:)=%"
set "modelEscaped=%modelEscaped:|=%%"
set "modelEscaped=%modelEscaped:^=%%"

:: Check if the model exists in the destination file
findstr /b /c:"%modelEscaped%" "%destination%" >nul

if !errorlevel! equ 0 (
   echo Model Produk: %CyanText%%model%%RESET% dan Serial Number: %BrightYellowText%%sn%%RESET% berhasil di Input
) else (
    echo Model tidak ditemukan dalam file.
    exit /b
)

:: Execute commands
amidewinx64.exe /sm "PT Zyrexindo Mandiri Buana Tbk"
amidewinx64.exe /bm "PT Zyrexindo Mandiri Buana Tbk"
amidewinx64.exe /sp "Zyrex %model%"
amidewinx64.exe /sv "1.0"
amidewinx64.exe /ss "%sn%"

:: Change directory and execute registry file
cd Yepo
start "" "PC (Client - GDR).reg"

pause
endlocal