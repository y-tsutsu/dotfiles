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
git config --global merge.tool 'code --wait "$MERGED"'
git config --global ghq.root $HOME/dev/src
sudo apt install -y subversion subversion-tools

# oh-my-zsh
if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

# terminator zsh tmux
sudo apt install -y terminator zsh tmux xsel

# python
sudo apt install -y libsqlite3-dev libreadline-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip libssl-dev libffi-dev
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
pyenv install 3.8.0
pyenv install 2.7.16
pyenv global 3.8.0
python --version
pip install --upgrade pip
pip install pip-tools
pip-compile $DOTFILES_DIR/requirements.in
pip-sync $DOTFILES_DIR/requirements.txt

# emacs vim
sudo apt install -y emacs vim

# golang
git clone https://github.com/syndbg/goenv.git $HOME/.goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
goenv install 1.13.1
goenv global 1.13.1
goenv rehash
mkdir $HOME/dev
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH
go get -u github.com/motemen/gore
go get -u github.com/nsf/gocode
go get -u github.com/k0kubun/pp
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/jessevdk/go-assets-builder
cd /tmp/
wget https://github.com/motemen/ghq/releases/download/v0.12.6/ghq_linux_amd64.zip
wget https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz
wget https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64
unzip ghq_linux_amd64.zip
mv ghq_linux_amd64/ghq $GOPATH/bin/.
tar -axvf peco_linux_amd64.tar.gz
mv peco_linux_amd64/peco $GOPATH/bin/.
chmod 755 dep-linux-amd64
mv dep-linux-amd64 $GOPATH/bin/dep

# Qt
sudo apt install -y qt5-default qtdeclarative5-dev qml-module-qtquick-controls

# Heroku
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

# etc.
sudo apt install -y ruby tig libncurses5-dev gdb valgrind strace meld fonts-inconsolata libappindicator-dev curl graphviz clang libclang-dev cmake \
    doxygen gconf2 locate rpm exuberant-ctags sshfs cifs-utils arc-theme libgles2-mesa-dev libegl1-mesa-dev xorg-dev jp2a apt-file libtinfo5

# node(npm)
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt update
sudo apt install -y nodejs

# Visual Studio Code
cd $HOME
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
$DOTFILES_DIR/vscode/install_vscode_extensions.sh

# GitKraken
sudo apt install -y gvfs-bin
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
cd /tmp/
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/10/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-3.0

# HackGen
cd /tmp/
wget https://github.com/yuru7/HackGen/releases/download/v1.1.0/HackGen_v1.1.0.zip
unzip HackGen_v1.1.0.zip
mkdir -p /home/tsutsu/.local/share/fonts/HackGen
mv ./HackGen*.ttf /home/tsutsu/.local/share/fonts/HackGen/.
sudo fc-cache -fv

# Cascadia Code
cd /tmp/
wget https://github.com/microsoft/cascadia-code/releases/download/v1909.16/Cascadia.ttf
mkdir -p /home/tsutsu/.local/share/fonts
mv ./Cascadia.ttf /home/tsutsu/.local/share/fonts/.
sudo fc-cache -fv

# Google Test
sudo apt install -y libgtest-dev
cd /usr/src/gtest/
sudo cmake .
sudo make -j4
sudo ln -s *.a /usr/lib/.

# zaw.zsh(history utility)
cd $HOME
git clone git://github.com/zsh-users/zaw.git

sudo apt update
sudo apt upgrade -y
