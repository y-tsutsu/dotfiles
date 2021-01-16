#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
    alefragnani.Bookmarks
    bungcip.better-toml
    christian-kohler.path-intellisense
    codezombiech.gitignore
    eamodio.gitlens
    EditorConfig.EditorConfig
    formulahendry.code-runner
    golang.go
    jebbs.plantuml
    Kelvin.vscode-sshfs
    marp-team.marp-vscode
    mechatroner.rainbow-csv
    mhutchie.git-graph
    michelemelluso.code-beautifier
    ms-azuretools.vscode-docker
    MS-CEINTL.vscode-language-pack-ja
    ms-dotnettools.csharp
    ms-python.python
    ms-vscode-remote.vscode-remote-extensionpack
    ms-vscode.cmake-tools
    ms-vscode.cpptools
    octref.vetur
    s-nlf-fh.glassit
    seanwu.vscode-qt-for-python
    shakram02.bash-beautify
    shuworks.vscode-table-formatter
    teabyii.ayu
    wmaurer.vscode-jumpy
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
