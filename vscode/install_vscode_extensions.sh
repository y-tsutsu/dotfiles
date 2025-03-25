#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
    alefragnani.bookmarks
    chaitanyashahare.lazygit
    christian-kohler.path-intellisense
    codezombiech.gitignore
    eamodio.gitlens
    editorconfig.editorconfig
    formulahendry.code-runner
    funkyremi.vscode-google-translate
    golang.go
    jebbs.plantuml
    kelvin.vscode-sshfs
    marp-team.marp-vscode
    mechatroner.rainbow-csv
    mhutchie.git-graph
    michelemelluso.code-beautifier
    ms-azuretools.vscode-docker
    ms-ceintl.vscode-language-pack-ja
    ms-dotnettools.csdevkit
    ms-python.autopep8
    ms-python.flake8
    ms-python.isort
    ms-python.python
    ms-vscode-remote.vscode-remote-extensionpack
    ms-vscode.cmake-tools
    ms-vscode.cpptools
    redhat.vscode-yaml
    rust-lang.rust-analyzer
    s-nlf-fh.glassit
    shakram02.bash-beautify
    shuworks.vscode-table-formatter
    tamasfe.even-better-toml
    teabyii.ayu
    theqtcompany.qt
    tranhl.find-then-jump
    vadimcn.vscode-lldb
    vue.volar
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
