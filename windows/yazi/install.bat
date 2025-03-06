@echo off

set WORK=%~dp0
cd /d %WORK%

sudo winget install -e --id=sxyazi.yazi

git clone https://github.com/mgumz/yazi-plugin-bat.git %APPDATA%/yazi/config/plugins/bat.yazi

echo @@@ reload the environment variables! @@@
ya pack -a dedukun/bookmarks
