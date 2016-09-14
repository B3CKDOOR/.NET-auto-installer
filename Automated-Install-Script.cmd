@echo off
pushd %~dp0

color 1f
Title .NET Automated Install Script - Prohulp
:Elevate Permissions routine
    pushd "%CD%"
    CD /D "%~dp0"
(NET FILE||(powershell -command Start-Process '%0' -Verb runAs -ArgumentList '%* '&EXIT /B))>NUL 2>NUL
:End Elevation Routine
ECHO -------------------------------------------------------------------------------
echo.                          .NET Installer
ECHO -------------------------------------------------------------------------------

ECHO This script will install all of the .Net redistributables
ECHO -------------------------------------------------------------------------------
CHOICE /c YN /n /M "Run this script? (Y/N): "
set errortemp=%ERRORLEVEL%
IF %ERRORTEMP% EQU 2 EXIT
IF %ERRORTEMP% EQU 0 EXIT

:Install the Netfx 4.5.2 redist and patches
ECHO.
echo Installing all of the .Net redistributables

ECHO.
echo .NET_3.5.exe /passive /norestart /nobackup
echo Installing .NET 3.5.30729.1
ECHO.
echo .NET_4.6.exe /passive /norestart /nobackup
echo Installing .NET 4.6.81.0
ECHO.
echo .NET_4.5.exe /passive /norestart /nobackup
echo Installing .NET 4.5.51209.34209
ECHO.
echo VisualC++2015.exe /passive /norestart /nobackup
echo Installing Visual C++ 14.0.23026.0

:DONE
ECHO -------------------------------------------------------------------------------
echo.                                 Finished
ECHO -------------------------------------------------------------------------------
echo Press any key to exit...
pause>NUL