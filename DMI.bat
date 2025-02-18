@echo off
setlocal

call warna.bat

set /p model=Input Model Product :
set /p sn=Input Serial Number Product :
set destination="D:\Template Copy Text\PC.txt"

echo Model Product : %CyanText%Zyrex %model%%RESET% ^| %BrightMagentaText%Serial Number : %sn%%RESET%
echo.

if not exist %destination% (
  echo %destination% is not found
  exit /b
)

find /n /i "%model%" %destination% > nul

if %errorlevel% equ 0 (
  amidewinx64.exe /sm "PT Zyrexindo Mandiri Buana Tbk"
  amidewinx64.exe /bm "PT Zyrexindo Mandiri Buana Tbk"
  amidewinx64.exe /sp "Zyrex %model%"
  amidewinx64.exe /sv "1.0"
  amidewinx64.exe /ss "%sn%"
  ) else (
  echo Not found model in the %destination%
)

endlocal
