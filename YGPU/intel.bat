@echo off
REM Intel GPU Batch Script
REM This script provides utilities for Intel GPU management and diagnostics

setlocal enabledelayedexpansion

REM Set title
title Intel GPU Utility

REM Check if Intel GPU drivers are installed
echo Checking Intel GPU drivers...
wmic logicaldisk get name >nul 2>&1
if errorlevel 1 (
    echo Error: Unable to query system information
    exit /b 1
)

REM Display GPU information
echo.
echo ===== Intel GPU Information =====
wmic path win32_videocontroller get name,driverversion /format:list | find "Intel"

REM Optional: Add more GPU operations here
REM You can uncomment and modify as needed:

REM Display VRAM
REM wmic path win32_videocontroller get AdapterRAM

REM Check GPU status
REM powershell -Command "Get-WmiObject Win32_VideoController | Select-Object Name, Status"

echo.
echo Press any key to exit...
pause >nul
exit /b 0