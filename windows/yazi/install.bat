@echo off

set WORK=%~dp0
cd /d %WORK%

winget install -e --id=sxyazi.yazi

echo @@@ reload the environment variables! @@@
ya pack -a dedukun/bookmarks
