#!/bin/bash

DOTFILES_DIR=`pwd`
cd $HOME

mkdir $HOME/.config

# 日本語化
sudo apt update
sudo apt upgrade -y
sudo apt install -y task-japanese
sudo dpkg-reconfigure locales
sudo dpkg-reconfigure tzdata
sudo apt install -y man

# build-essential
sudo apt install -y build-essential

# git
sudo apt install -y git
git config --global user.name 'tsutsu'
git config --global user.email 'tsutsu0928@gmail.com'
git config --global core.editor 'code --wait'
git config --global merge.tool 'code --wait "$MERGED"'
git config --global push.default simple
git config --global pull.rebase false
git config --global core.quotepath false
git config --global alias.mylog 'log --graph --name-status --pretty=format:"%C(red)%h %C(green)%an %Creset%s %C(yellow)%d%Creset"'
git config --global ghq.root $HOME/dev/src

# terminator zsh tmux
sudo apt install -y terminator zsh tmux xsel curl

# oh-my-zsh
if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zaw.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zaw
fi

# starship
curl https://starship.rs/install.sh -fsSL | sh -s -- -y

# Tmux Plugin Manager
if [ ! -e $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# etc.
sudo apt install -y vim ruby tig gdb valgrind strace clang libclang-dev cmake locate rpm exuberant-ctags sshfs jp2a apt-file xclip gettext-base

# python
sudo apt install -y libsqlite3-dev libreadline-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip libssl-dev libffi-dev wget \
    llvm libncursesw5-dev xz-utils  libxml2-dev libxmlsec1-dev liblzma-dev
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
git clone https://github.com/pyenv/pyenv-update.git $HOME/.pyenv/plugins/pyenv-update
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
pyenv install 3.10.8
pyenv global 3.10.8
python --version
pip install --upgrade pip setuptools
pip install pip-tools
pip-compile $DOTFILES_DIR/requirements.in
pip-sync $DOTFILES_DIR/requirements.txt

# golang
git clone https://github.com/syndbg/goenv.git $HOME/.goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
goenv install 1.19.2
goenv global 1.19.2
goenv rehash
mkdir $HOME/dev
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH
go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/nsf/gocode@latest
go install github.com/k0kubun/pp@latest
go install golang.org/x/tools/cmd/godoc@latest
go install github.com/jessevdk/go-assets-builder@latest
cd /tmp/
wget https://github.com/x-motemen/ghq/releases/download/v1.3.0/ghq_linux_amd64.zip
wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
wget https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64
unzip ghq_linux_amd64.zip
mv ghq_linux_amd64/ghq $GOPATH/bin/.
tar -axvf peco_linux_amd64.tar.gz
mv peco_linux_amd64/peco $GOPATH/bin/.
chmod 755 dep-linux-amd64
mv dep-linux-amd64 $GOPATH/bin/dep

# node(npm)
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt update
sudo apt install -y nodejs

# Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# .NET Core
cd /tmp/
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-6.0

# Docker
cd /tmp/
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install -y ca-certificates gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker
sudo curl -L https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Google Test
sudo apt install -y libgtest-dev
cd /usr/src/gtest/
sudo cmake .
sudo make -j4
sudo ln -s `pwd`/lib/*.a /usr/lib/.

sudo apt update
sudo apt upgrade -y
