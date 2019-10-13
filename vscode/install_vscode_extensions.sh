#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
    alefragnani.Bookmarks
    bbenoist.QML
    bungcip.better-toml
    donjayamanne.githistory
    eamodio.gitlens
    EditorConfig.EditorConfig
    formulahendry.code-runner
    ionutvmi.path-autocomplete
    jebbs.plantuml
    Kelvin.vscode-sshfs
    mechatroner.rainbow-csv
    michelemelluso.code-beautifier
    MS-CEINTL.vscode-language-pack-ja
    ms-python.python
    ms-vscode.cpptools
    ms-vscode.csharp
    ms-vscode.Go
    ms-vscode-remote.vscode-remote-extensionpack
    octref.vetur
    PeterJausovec.vscode-docker
    shakram02.bash-beautify
    shuworks.vscode-table-formatter
    teabyii.ayu
    twxs.cmake
    wmaurer.vscode-jumpy
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
