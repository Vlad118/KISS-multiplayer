@echo off
rem KISSMP mod zip patch

rem === CONFIG ===
set "SRC=E:\kissmp stuff\KISS-multiplayer\KISSMultiplayer"
set "DST=D:\Games\BeamNG.drive\BeamNG.driveMods\current\mods"
set "ZIP_NAME=KISSMultiplayer"
set "WINRAR=D:\Programs\WinRAR\WinRAR.exe"
rem ===============

set "TEMPZIP=%TEMP%\%ZIP_NAME%-tmp.zip"
set "FINALZIP=%DST%\%ZIP_NAME%.zip"

if not exist "%SRC%" (echo [ERROR] Source not found: %SRC% & pause & exit /b 1)
if not exist "%DST%" (echo [ERROR] Destination not found: %DST% & pause & exit /b 1)
if not exist "%WINRAR%" (echo [ERROR] WinRAR not found at: %WINRAR% & echo Please set WINRAR variable at top of this file & pause & exit /b 1)

echo Creating zip from "%SRC%" ...
if exist "%TEMPZIP%" del /f "%TEMPZIP%" >nul
"%WINRAR%" a -afzip -r -ep1 -m5 "%TEMPZIP%" "%SRC%\*"

if not exist "%TEMPZIP%" (echo [ERROR] Zip creation failed & pause & exit /b 1)
if exist "%FINALZIP%" del /f "%FINALZIP%" >nul
move /y "%TEMPZIP%" "%FINALZIP%" >nul

echo Patch complete. Saved: "%FINALZIP%"
