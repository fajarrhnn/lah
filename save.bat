@echo off

IF NOT EXIST "F:\Testing\Result\" (
    mkdir "F:\Testing\Result\" || (echo Failed to create directory & exit /b)
)

for /f "tokens=2 delims==" %%A IN ('wmic bios get serialnumber /value') DO SET "SNUnit=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic bios get name /value') DO SET "Mainboard=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic csproduct get name /value') DO SET "SystemModel=%%A" 
for /f "tokens=2 delims==" %%A IN ('wmic csproduct get uuid /value') DO SET "UUID=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic csproduct get vendor /value') DO SET "SystemManufacturer=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic csproduct get version /value') DO SET "SystemVersion=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic baseboard get manufacturer /value') DO SET "BaseboardManufacturer=%%A" 
for /f "tokens=2 delims==" %%A IN ('wmic baseboard get serialnumber /value') DO SET "SNMainboard=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic os get csname /value') DO SET "DeviceName=%%A" 
for /f "tokens=2 delims==" %%A IN ('wmic os get caption /value') DO SET "OSName=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic os get manufacturer /value') DO SET "OSManufacturer=%%A"
for /f "tokens=2 delims==" %%A IN ('wmic path softwarelicensingservice get oa3xoriginalproductkey /value') DO SET "License=%%A"

IF EXIST "F:\Testing\Result\%SNUnit%.txt" (
   echo File already exists
   call view.bat
) ELSE (
    (
        IF "%License%"=="" (
        echo SerialNumber: "%SNUnit%" ^| License: No License
        ) ELSE (
        echo SerialNumber: "%SNUnit%" ^| License: "%License%"
        )
    echo System Manufacturer: "%SystemManufacturer%" ^| System Model: "%SystemModel%"
    echo System Version: "%SystemVersion%" ^| UUID: "%UUID%"
    echo OS Name: "%OSName%" ^| OS Manufacturer: "%OSManufacturer%" ^| Unit Name: "%DeviceName%"
    echo Baseboard Manufacturer: "%BaseboardManufacturer%" ^| Mainboard Model: "%Mainboard%" ^| SN Mainboard: "%SNMainboard%"
    ) > "F:\Testing\Result\%SNUnit%.txt" || (echo Failed to write to file & exit /b)
    echo A new file has been created
)