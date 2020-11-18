@echo off

set WORK=%~dp0
cd /d %WORK%

go get -u github.com/motemen/gore
go get -u github.com/nsf/gocode
go get -u github.com/k0kubun/pp
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/jessevdk/go-assets-builder

mkdir temp
cd temp

wget --no-check-certificate https://github.com/x-motemen/ghq/releases/download/v1.1.5/ghq_windows_amd64.zip
wget --no-check-certificate https://github.com/peco/peco/releases/download/v0.5.8/peco_windows_amd64.zip
wget --no-check-certificate https://github.com/golang/dep/releases/download/v0.5.4/dep-windows-amd64.exe
unzip ghq_windows_amd64.zip
mv ghq_windows_amd64/ghq %GOPATH%/bin/.
unzip peco_windows_amd64.zip
mv peco_windows_amd64/peco %GOPATH%/bin/.
chmod 755 dep-windows-amd64.exe
mv dep-windows-amd64.exe %GOPATH%/bin/dep.exe

cd ..
rm -rf ./temp
