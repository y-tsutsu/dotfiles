#!/bin/bash

# execute command
# -------------------
# curl -s https://gist.githubusercontent.com/busonx/f0e9644c7685097fe8916546f1a95f5d/raw/78e86b7226e02c627ae937a3ff4a6d85f9092cbb/install-centos7.x-vscode-extensions.sh | /bin/bash

# Visual Studio Code :: Package list
pkglist=(
    alefragnani.Bookmarks
    donjayamanne.githistory
    donjayamanne.python
    EditorConfig.EditorConfig
    espresso3389.sushi-vscode
    formulahendry.code-runner
    hars.CppSnippets
    ionutvmi.path-autocomplete
    jebbs.plantuml
    ms-vscode.cpptools
    ms-vscode.csharp
    twxs.cmake
    wmaurer.vscode-jumpy
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
