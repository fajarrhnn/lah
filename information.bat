@echo off
call warna.bat
for /f "tokens=2 delims==" %%A IN ('wmic bios get serialnumber /value') DO SET "SNUnit=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic csproduct get name /value') DO SET "SystemModel=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic csproduct get vendor /value') DO SET "SystemManufacturer=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic os get csname /value') DO SET "DeviceName=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic os get caption /value') DO SET "OSName=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic path softwarelicensingservice get oa3xoriginalproductkey /value') DO SET "License=%%A"

IF "%License%"=="" (
        echo SerialNumber: %CyanText%%SNUnit%%RESET% ^| License: %RedBG%%WhiteText%No License%RESET%%RESET%
        ) ELSE (
        echo SerialNumber: %CyanText%%SNUnit%%RESET% ^| License: %BlueBG%%WhiteText%%License%%RESET%%RESET%
        )
    echo System Manufacturer: %BrightMagentaText%%SystemManufacturer%%RESET% ^| System Model: %YellowText%%SystemModel%%RESET%
    echo Unit Name: %GreenText%%DeviceName%%RESET% ^| OS Name: %BlueBG%%WhiteText%%OSName%%RESET%%RESET%