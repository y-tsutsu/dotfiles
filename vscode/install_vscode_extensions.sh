#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
    alefragnani.Bookmarks
    christian-kohler.path-intellisense
    codezombiech.gitignore
    eamodio.gitlens
    EditorConfig.EditorConfig
    formulahendry.code-runner
    funkyremi.vscode-google-translate
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
    ms-python.autopep8
    ms-python.flake8
    ms-python.isort
    ms-python.python
    ms-vscode-remote.vscode-remote-extensionpack
    ms-vscode.cmake-tools
    ms-vscode.cpptools
    octref.vetur
    rust-lang.rust-analyzer
    s-nlf-fh.glassit
    seanwu.vscode-qt-for-python
    shakram02.bash-beautify
    shuworks.vscode-table-formatter
    tamasfe.even-better-toml
    teabyii.ayu
    tranhl.find-then-jump
    vadimcn.vscode-lldb
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
