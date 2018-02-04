#!/bin/bash

# execute command
# -------------------
# curl -s https://gist.githubusercontent.com/busonx/f0e9644c7685097fe8916546f1a95f5d/raw/78e86b7226e02c627ae937a3ff4a6d85f9092cbb/install-centos7.x-vscode-extensions.sh | /bin/bash

# Visual Studio Code :: Package list
pkglist=(
    EditorConfig.EditorConfig
    PeterJausovec.vscode-docker
    alefragnani.Bookmarks
    bbenoist.QML
    donjayamanne.githistory
    formulahendry.code-runner
    hars.CppSnippets
    ionutvmi.path-autocomplete
    jebbs.plantuml
    michelemelluso.code-beautifier
    ms-python.python
    ms-vscode.cpptools
    ms-vscode.csharp
    ryu1kn.annotator
    shakram02.bash-beautify
    teabyii.ayu
    twxs.cmake
    wmaurer.vscode-jumpy
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
