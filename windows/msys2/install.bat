@echo off

set WORK=%~dp0
cd /d %WORK%

pacman -Syuu
pacman -S base-devel msys2-devel mingw-w64-x86_64-toolchain mingw64/mingw-w64-x86_64-clang
pacman -Syuu
