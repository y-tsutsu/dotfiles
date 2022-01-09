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
CONFIG_FILES=( terminator starship.toml )
for file in ${CONFIG_FILES[@]}
do
    if [ -d $CONFIG_DIR/$file ]; then
        ln -s $CONFIG_DIR/$file $HOME/.config
    else
        ln -s $CONFIG_DIR/$file $HOME/.config/$file
    fi
done
