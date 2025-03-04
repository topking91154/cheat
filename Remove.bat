@echo off
setlocal enabledelayedexpansion

:: Ensure administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

:: Set console text color to green
color 0A

:: Display header
echo.
echo  ==============================
echo  =      [32mCheat Remover[0m       =
echo  ==============================
echo.

:: Notify user
echo [32mRemoving cheat files...[0m
timeout /t 2 >nul

:: Remove registry key (delete the cheat)
reg delete "HKLM\SYSTEM\ControlSet001\Services\WinSock2\Parameters" /v AutodialDLL /F

:: Notify user
echo [32mRunning system scan...[0m
timeout /t 2 >nul

:: Run system file checker (visible)
sfc /scannow

:: Notify completion
echo.
echo [32mCheat removed successfully. Restarting system...[0m
timeout /t 5 >nul

:: Restart system
shutdown /r /t 0
