#!/bin/bash

DOTFILES_DIR=`pwd`
cd $HOME

# build-essential
#sudo aptitude install build-essential -y

# open-vm-tools
#sudo aptitude install open-vm-tools open-vm-tools-desktop -y

# git subversion（git本体は事前にインストール）
git config --global user.name 'tsutsu'
git config --global user.email 'tsutsu@example.com'
git config --global core.editor 'emacs -nw'
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global push.default simple
git config --global core.precomposeunicode true
git config --global core.quotepath false
git config --global alias.mylog 'log --graph --name-status --pretty=format:"%C(red)%h %C(green)%an %Creset%s %C(yellow)%d%Creset"'
git config --global merge.tool 'meld'
sudo aptitude install subversion subversion-tools -y

# terminator zsh tmux
sudo aptitude install terminator zsh tmux xsel -y

# python
sudo aptitude install libsqlite3-dev libreadline6-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 tk-dev zip libssl-dev -y
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
pyenv install 3.6.1
pyenv install 2.7.13
pyenv global 3.6.1

# emacs vim
sudo aptitude install emacs vim -y

# atom（本体は事前にdebファイルからインストール）
#apm install --packages-file $DOTFILES_DIR/apm_packages.txt

# rtags build
sudo aptitude install clang libclang-dev cmake -y
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
sudo aptitude install golang -y
git clone https://github.com/bearmini/crror.git ~/crror

# Qt
sudo aptitude install qt5-default -y

# etc.
sudo aptitude install ruby nodejs npm tig libncurses5-dev gdb valgrind strace meld clipit fonts-inconsolata libappindicator-dev curl graphviz doxygen gtk2-engines-murrine -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
