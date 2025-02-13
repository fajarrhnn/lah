@echo off

set ESC=
set RESET=%ESC%[0m

:: Set the foreground colors variables
set RedText=%ESC%[31m
set YellowText=%ESC%[33m
set CyanText=%ESC%[36m
set WhiteText=%ESC%[37m
set GreenText=%ESC%[32m
set BrightMagentaText=%ESC%[95m

:: Set the background colors variables
set WhiteBG=%ESC%[47m
set BlueBG=%ESC%[44m
set RedBG=%ESC%[41m



:: Kode Warna ANSI (Foreground / Background)

@REM [30 = Hitam / Reset        @REM Hitam = [40m
@REM [31 = Merah                @REM Merah = [41m
@REM [32 = Hijau                @REM Hijau = [42m
@REM [33 = Kuning               @REM Kuning = [43m
@REM [34 = Biru                 @REM Biru = [44m
@REM [35 = Magenta              @REM Magenta = [45m
@REM [36 = Cyan                 @REM Cyan = [46m
@REM [37 = Putih                @REM Putih = [47m



:: Kode Warna ANSI warna terang (90-97 = foreground, 100-107 = Background)
@REM  Hitam Terang   |[90m   |[100m 
@REM  Merah Terang   |[91m   |[101m 
@REM  Hijau Terang   |[92m   |[102m 
@REM  Kuning Terang  |[93m   |[103m 
@REM  Biru Terang    |[94m   |[104m 
@REM  Magenta Terang |[95m   |[105m 
@REM  Cyan Terang    |[96m   |[106m 
@REM  Putih Terang   |[97m   |[107m 
