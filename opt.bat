cls
@echo off
title mangos.click - [ optimizer ]

:: Beep sound using PowerShell
powershell -c "[console]::beep(800,300)"

:: Intro screen
echo ============================
echo   mangos.click optimizer
echo ============================
echo.
echo press any key to load
echo find more files at: https://mangos.click
pause > nul

cls
echo ============================
echo   Running Optimizations...
echo ============================

echo Cleaning %TEMP% folder...
del /q /f /s "%TEMP%\*.*" > nul 2>&1
rd /s /q "%TEMP%" > nul 2>&1
md "%TEMP%"

echo Clearing recent documents...
del /q "%APPDATA%\Microsoft\Windows\Recent\*.*" > nul 2>&1

echo Cleaning thumbnail cache...
del /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" > nul 2>&1

echo Flushing DNS cache...
ipconfig /flushdns > nul 2>&1 || echo DNS flush requires admin, skipping...

echo Cleaning Edge/Chrome browser cache...
del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" > nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" > nul 2>&1

wmic startup get caption,command > "%TEMP%\StartupApps.txt"
start notepad "%TEMP%\StartupApps.txt"

cls
echo optimized!
echo thanks for using mangos.click optimizer.
pause > nul
