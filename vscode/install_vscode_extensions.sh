#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
    alefragnani.Bookmarks
    bbenoist.QML
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
    octref.vetur
    PeterJausovec.vscode-docker
    RomanPeshkov.vscode-text-tables
    shakram02.bash-beautify
    teabyii.ayu
    twxs.cmake
    wmaurer.vscode-jumpy
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
