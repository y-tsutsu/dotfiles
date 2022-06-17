@echo off

set WORK=%~dp0
cd /d %WORK%

@REM sl clone & patch
git clone https://github.com/sgymtic/sl.git
cd ./sl
git checkout pyonpyon
patch -p1 < ../diff.patch

@REM PDCurses clone & build
git clone https://github.com/wmcbrine/PDCurses.git
cd PDCurses/wincon
git checkout a7b47c22
make -j2
mv ./pdcurses.a ./libpdcurses.a

@REM sl build
cd ../../
make -j2

@REM make link
mklink %GOPATH%\bin\sl.exe %WORK%\sl\pyonpyon.exe

cd /d %WORK%
