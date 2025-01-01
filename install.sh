#!/bin/bash

DOTFILES_DIR=`pwd`
cd $HOME

# build-essential
# sudo apt install -y build-essential

# open-vm-tools
# sudo apt install -y open-vm-tools open-vm-tools-desktop

# git subversion（git本体は事前にインストール）
# sudo apt install -y git
git config --global user.name 'tsutsu'
git config --global user.email 'tsutsu0928@gmail.com'
git config --global core.editor 'code --wait'
git config --global merge.tool 'code --wait "$MERGED"'
git config --global push.default simple
git config --global pull.rebase false
git config --global core.quotepath false
git config --global alias.mylog 'log --graph --color=always --name-status --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
git config --global ghq.root $HOME/dev/src
sudo apt install -y subversion subversion-tools

# terminator zsh tmux
sudo apt install -y terminator zsh tmux xsel curl

# oh-my-zsh
if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zaw.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zaw
    git clone https://github.com/z-shell/zsh-diff-so-fancy.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-diff-so-fancy
fi

# starship
curl https://starship.rs/install.sh -fsSL | sh -s -- -y

# Tmux Plugin Manager
if [ ! -e $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# emacs vim
sudo apt install -y vim emacs texinfo

# etc.
sudo apt install -y ruby tig libncurses5-dev gdb valgrind strace meld fonts-inconsolata graphviz clang libclang-dev cmake doxygen \
    gconf2 locate rpm exuberant-ctags sshfs cifs-utils arc-theme libgles2-mesa-dev libegl1-mesa-dev xorg-dev jp2a apt-file libtinfo5 xclip

# python
sudo apt install -y libsqlite3-dev libreadline-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip libssl-dev libffi-dev wget \
    llvm libncursesw5-dev xz-utils  libxml2-dev libxmlsec1-dev liblzma-dev
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
git clone https://github.com/pyenv/pyenv-update.git $HOME/.pyenv/plugins/pyenv-update
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
pyenv install 3.12.8
pyenv global 3.12.8
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
goenv install 1.23.4
goenv global 1.23.4
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
wget https://github.com/x-motemen/ghq/releases/download/v1.7.1/ghq_linux_amd64.zip
wget https://github.com/peco/peco/releases/download/v0.5.11/peco_linux_amd64.tar.gz
wget https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64
unzip ghq_linux_amd64.zip
mv ghq_linux_amd64/ghq $GOPATH/bin/.
tar -axvf peco_linux_amd64.tar.gz
mv peco_linux_amd64/peco $GOPATH/bin/.
chmod 755 dep-linux-amd64
mv dep-linux-amd64 $GOPATH/bin/dep

# node(npm)
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt update
sudo apt install -y nodejs

# Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Qt
sudo apt install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools qtdeclarative5-dev qtwayland5 qtwayland5-dev-tools

# .NET
cd /tmp/
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-8.0

# Visual Studio Code
cd /tmp/
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
$DOTFILES_DIR/vscode/install_vscode_extensions.sh

# Vivaldi
cd /tmp/
VIVALDI_DEB=vivaldi-stable_6.7.3329.17-1_amd64.deb
wget -q https://downloads.vivaldi.com/stable/$VIVALDI_DEB
sudo dpkg -i $VIVALDI_DEB
sudo apt install -y -f

# Docker
cd /tmp/
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt remove $pkg; done
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

# lazygit
cd /tmp/
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
sudo npm install -g diff-so-fancy

# HackGen
cd /tmp/
HACKGEN_VERSION=v2.9.0
wget https://github.com/yuru7/HackGen/releases/download/${HACKGEN_VERSION}/HackGen_${HACKGEN_VERSION}.zip
unzip HackGen_${HACKGEN_VERSION}.zip
mkdir -p /home/tsutsu/.local/share/fonts/HackGen
mv ./HackGen_${HACKGEN_VERSION}/HackGen*.ttf /home/tsutsu/.local/share/fonts/HackGen/.
sudo fc-cache -fv

# UDEV Gothic
cd /tmp/
UDEVG_VERSION=v1.3.1
wget https://github.com/yuru7/udev-gothic/releases/download/${UDEVG_VERSION}/UDEVGothic_${UDEVG_VERSION}.zip
unzip UDEVGothic_${UDEVG_VERSION}.zip
mkdir -p /home/tsutsu/.local/share/fonts/UDEVGothic
mv ./UDEVGothic_${UDEVG_VERSION}/UDEVGothic*.ttf /home/tsutsu/.local/share/fonts/UDEVGothic/.
sudo fc-cache -fv

# Cascadia Code
cd /tmp/
wget https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip
unzip CascadiaCode-2111.01.zip
mkdir -p /home/tsutsu/.local/share/fonts/cascadia
mv ./ttf/Cascadia*.ttf /home/tsutsu/.local/share/fonts/cascadia/.
sudo fc-cache -fv

# Google Test
sudo apt install -y libgtest-dev
cd /usr/src/gtest/
sudo cmake .
sudo make -j4
sudo ln -s `pwd`/lib/*.a /usr/lib/.

# VMware share
sudo mkdir /mnt/hgfs
echo '.host:/ /mnt/hgfs fuse.vmhgfs-fuse allow_other 0 0' | sudo tee -a /etc/fstab

sudo apt update
sudo apt upgrade -y
