#!/bin/bash

rm $HOME/.bashrc
rm $HOME/.zshenv

DOTFILES_DIR=`pwd`
DOT_FILES=( .emacs.d .vim .bashrc .tmux.conf .zshenv .zshrc .vimrc .tigrc serval.jpg )

for file in ${DOT_FILES[@]}
do
    if [ -d $DOTFILES_DIR/$file ]; then
        ln -s $DOTFILES_DIR/$file $HOME
    else
        ln -s $DOTFILES_DIR/$file $HOME/$file
    fi
done

CONFIG_DIR=$DOTFILES_DIR/.config
CONFIG_FILES=( lazygit peco terminator yazi starship.toml )
for file in ${CONFIG_FILES[@]}
do
    if [ -d $CONFIG_DIR/$file ]; then
        ln -s $CONFIG_DIR/$file $HOME/.config
    else
        ln -s $CONFIG_DIR/$file $HOME/.config/$file
    fi
done

# yaziディレクトリの移動後に実行したいのでinstall.shから移動
ya pack -a dedukun/bookmarks
git clone https://github.com/mgumz/yazi-plugin-bat.git ~/.config/yazi/plugins/bat.yazi
patch -d ~/.config/yazi/plugins/bat.yazi -p1 < ./.config/yazi/yazi-bat.patch
