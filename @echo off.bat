@echo off
title WatchAnything Setup (FFmpeg Installer)

setlocal

echo ==========================================
echo   WATCHANYTHING AUTO SETUP
echo   Installing FFmpeg (portable)
echo ==========================================
echo.

set INSTALL_DIR=%~dp0ffmpeg
set ZIP=%~dp0ffmpeg.zip

echo Creating folder...
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

echo Downloading FFmpeg...
powershell -Command "Invoke-WebRequest -Uri https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip -OutFile '%ZIP%'"

echo Extracting...
powershell -Command "Expand-Archive -Force '%ZIP%' '%INSTALL_DIR%'"

echo Cleaning up...
del "%ZIP%"

echo Setting PATH for this session...
set PATH=%INSTALL_DIR%\bin;%PATH%

echo Testing FFmpeg...
ffmpeg -version

echo.
echo FFmpeg installed (portable mode).
echo Launching WatchAnything...
start "" "%~dp0WatchAnything.exe"

pause