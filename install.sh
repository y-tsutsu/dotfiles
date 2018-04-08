#!/bin/bash

DOTFILES_DIR=`pwd`
cd $HOME

# build-essential
#sudo apt install -y build-essential

# open-vm-tools
#sudo apt install -y open-vm-tools open-vm-tools-desktop

# git subversion（git本体は事前にインストール）
git config --global user.name 'tsutsu'
git config --global user.email 'tsutsu@example.com'
git config --global core.editor 'code --wait'
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global push.default simple
git config --global core.precomposeunicode true
git config --global core.quotepath false
git config --global alias.mylog 'log --graph --name-status --pretty=format:"%C(red)%h %C(green)%an %Creset%s %C(yellow)%d%Creset"'
git config --global merge.tool 'meld'
sudo apt install -y subversion subversion-tools

# terminator zsh tmux
sudo apt install -y terminator zsh tmux xsel

# python
sudo apt install -y libsqlite3-dev libreadline-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip libssl-dev
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
pyenv install 3.6.5
pyenv install 2.7.14
pyenv global 3.6.5
pip install pip-tools
pip-compile $DOTFILES_DIR/requirements.in
pip-sync $DOTFILES_DIR/requirements.txt

# emacs vim
sudo apt install -y emacs vim

# atom（本体は事前にdebファイルからインストール）
#apm install --packages-file $DOTFILES_DIR/apm_packages.txt

# rtags build
sudo apt install -y clang libclang-dev cmake
git clone https://github.com/Andersbakken/rtags $HOME/rtags
cd $HOME/rtags
git submodule init
git submodule update
mkdir build && cd build
cmake ..
make -j2 && sudo make install

# rtags setup
git clone https://github.com/rizsotto/Bear $HOME/Bear
cd $HOME/Bear
mkdir build && cd build
cmake ..
make -j2 && sudo make install

# crror
sudo apt install -y golang
git clone https://github.com/bearmini/crror.git ~/crror

# Qt
sudo apt install -y qt5-default qtdeclarative5-dev qml-module-qtquick-controls

# Heroku
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

# etc.
sudo apt install -y ruby tig libncurses5-dev gdb valgrind strace meld clipit fonts-inconsolata libappindicator-dev curl \
    graphviz doxygen gconf2 locate rpm exuberant-ctags sshfs cifs-utils arc-theme libgles2-mesa-dev libegl1-mesa-dev xorg-dev jp2a

# node(npm)
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt install -y nodejs

# Visual Studio Code
cd $HOME
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
$DOTFILES_DIR/vscode/install_vscode_extensions.sh

# GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
sudo apt install -y -f
rm gitkraken-amd64.deb

# Vivaldi
VIVALDI_DEB=vivaldi-stable_1.14.1077.45-1_amd64.deb
wget -q https://downloads.vivaldi.com/stable/$VIVALDI_DEB
sudo dpkg -i $VIVALDI_DEB
sudo apt install -y -f
rm $VIVALDI_DEB

# Docker
sudo apt remove docker docker-engine docker.io
sudo apt install -y apt-transport-https ca-certificates gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable"
sudo apt update
sudo apt install -y docker-ce
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

# .NET Core
sudo apt install -y libunwind8 gettext
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt update
sudo apt install -y dotnet-sdk-2.1.4

# Google Test
sudo apt install -y libgtest-dev
cd /usr/src/gtest
sudo cmake .
sudo make -j2
sudo make install
