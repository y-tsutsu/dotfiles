@echo off

set WORK=%~dp0
cd /d %WORK%

mkdir temp
cd temp

git clone https://github.com/jakubmi9/Windows-screenFetch.git
mv Windows-screenFetch/screenfetch.ps1 %GOPATH%/bin/.

cd ..
rm -rf ./temp
