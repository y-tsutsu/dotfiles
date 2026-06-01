@echo off

set WORK=%~dp0
cd /d %WORK%

pacman -Syuu
pacman -S base-devel msys2-devel mingw-w64-ucrt-x86_64-toolchain mingw-w64-ucrt-x86_64-clang mingw-w64-ucrt-x86_64-ninja
pacman -Syuu
