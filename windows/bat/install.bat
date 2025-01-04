@echo off

set WORK=%~dp0
cd /d %WORK%

winget install -e --id=sharkdp.bat
