// auto.bat
@echo off
:menu
echo +----------------------------------------------+
echo +       S - Save The System File               +
echo +       L - View list data                     +
echo +       C - Cancel                             +
echo +----------------------------------------------+

choice /c SLC /n /m "Choose the tools: "

IF ERRORLEVEL 3 (
    echo You have chosen to cancel. Exiting...
    timeout /t 3
    exit
) ELSE IF ERRORLEVEL 2 (
    call view.bat
    pause
) ELSE IF ERRORLEVEL 1 (
    call save.bat
    pause
)

goto menu