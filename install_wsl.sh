#!/bin/bash

DOTFILES_DIR=`pwd`
cd $HOME

mkdir $HOME/.config

# 日本語化
sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y
sudo apt install -y language-pack-ja
sudo update-locale LANG=ja_JP.UTF8
sudo dpkg-reconfigure tzdata
sudo apt install -y manpages-ja manpages-ja-dev

# build-essential
sudo apt install -y build-essential

# git
sudo apt install -y git
git config --global user.name 'tsutsu'
git config --global user.email 'tsutsu0928@gmail.com'
git config --global core.editor 'code --wait'
git config --global merge.tool 'code --wait "$MERGED"'
git config --global push.default simple
git config --global core.quotepath false
git config --global alias.mylog 'log --graph --name-status --pretty=format:"%C(red)%h %C(green)%an %Creset%s %C(yellow)%d%Creset"'
git config --global ghq.root $HOME/dev/src

# terminator zsh tmux
sudo apt install -y terminator zsh tmux xsel

# oh-my-zsh
if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# zaw.zsh(history utility)
git clone git://github.com/zsh-users/zaw.git $HOME/zaw

# Tmux Plugin Manager
if [ ! -e $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# etc.
sudo apt install -y ruby tig gdb valgrind strace curl clang libclang-dev cmake locate rpm exuberant-ctags sshfs jp2a apt-file xclip

# python
sudo apt install -y libsqlite3-dev libreadline-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip libssl-dev libffi-dev wget
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
pyenv install 3.8.6
pyenv global 3.8.6
python --version
pip install --upgrade pip
pip install pip-tools
pip-compile $DOTFILES_DIR/requirements.in
pip-sync $DOTFILES_DIR/requirements.txt

# golang
git clone https://github.com/syndbg/goenv.git $HOME/.goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
goenv install 1.15.2
goenv global 1.15.2
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

# node(npm)
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt update
sudo apt install -y nodejs

# Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# .NET Core
cd /tmp/
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-3.1

# Google Test
sudo apt install -y libgtest-dev
cd /usr/src/gtest/
sudo cmake .
sudo make -j4
sudo ln -s *.a /usr/lib/.

sudo apt update
sudo apt upgrade -y
