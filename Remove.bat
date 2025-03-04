@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrative privileges. Restarting with admin rights...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

reg delete "HKLM\SYSTEM\ControlSet001\Services\WinSock2\Parameters" /v AutodialDLL /F

shutdown /r /t 0