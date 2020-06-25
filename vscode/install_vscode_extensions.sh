#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
    alefragnani.Bookmarks
    bbenoist.QML
    bungcip.better-toml
    christian-kohler.path-intellisense
    codezombiech.gitignore
    eamodio.gitlens
    EditorConfig.EditorConfig
    formulahendry.code-runner
    golang.Go
    jebbs.plantuml
    Kelvin.vscode-sshfs
    mechatroner.rainbow-csv
    mhutchie.git-graph
    michelemelluso.code-beautifier
    ms-azuretools.vscode-docker
    MS-CEINTL.vscode-language-pack-ja
    ms-dotnettools.csharp
    ms-python.python
    ms-vscode.cmake-tools
    ms-vscode.cpptools
    ms-vscode-remote.vscode-remote-extensionpack
    octref.vetur
    shakram02.bash-beautify
    shuworks.vscode-table-formatter
    teabyii.ayu
    wmaurer.vscode-jumpy
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
