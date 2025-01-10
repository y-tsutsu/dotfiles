@echo off

set WORK=%~dp0
cd /d %WORK%

go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/nsf/gocode@latest
go install github.com/k0kubun/pp@latest
go install golang.org/x/tools/cmd/godoc@latest
go install github.com/jessevdk/go-assets-builder@latest

mkdir temp
cd temp

wget --no-check-certificate https://github.com/x-motemen/ghq/releases/download/v1.3.0/ghq_windows_amd64.zip
wget --no-check-certificate https://github.com/peco/peco/releases/download/v0.5.10/peco_windows_amd64.zip
wget --no-check-certificate https://github.com/golang/dep/releases/download/v0.5.4/dep-windows-amd64.exe
unzip ghq_windows_amd64.zip
mv ghq_windows_amd64/ghq %GOPATH%/bin/.
unzip peco_windows_amd64.zip
mv peco_windows_amd64/peco %GOPATH%/bin/.
chmod 755 dep-windows-amd64.exe
mv dep-windows-amd64.exe %GOPATH%/bin/dep.exe

cd ..
rm -rf ./temp
