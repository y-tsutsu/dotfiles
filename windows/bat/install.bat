@echo off

set WORK=%~dp0
cd /d %WORK%

sudo winget install -e --id=sharkdp.bat
