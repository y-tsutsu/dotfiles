#!/bin/bash

rm $HOME/.bashrc

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

ln -s $DOTFILES_DIR/.flake8 $HOME/.config/flake8
