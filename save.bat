@echo off

IF NOT EXIST "D:\Testing ae\Result\" (
    mkdir "D:\Testing ae\Result\" || (echo Failed to create directory & exit /b)
)

IF EXIST "D:\Testing ae\Result\%SNUnit%.txt" (
    echo File already exists
    notepad D:\Testing ae\Result\%SNUnit%.txt
) ELSE (
    call information.bat > "D:\Testing ae\Result\%SNUnit%.txt" 
    echo A new file has been created
)
