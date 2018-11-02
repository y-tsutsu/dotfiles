#!/bin/bash

rm $HOME/.bashrc

DOTFILES_DIR=`pwd`
DOT_FILES=( .emacs.d .bashrc .tmux.conf .zshenv .zshrc .vimrc .tigrc serval.jpg )

for file in ${DOT_FILES[@]}
do
    if [ -d $DOTFILES_DIR/$file ]; then
        ln -s $DOTFILES_DIR/$file $HOME
    else
        ln -s $DOTFILES_DIR/$file $HOME/$file
    fi
done

ln -s $DOTFILES_DIR/.flake8 $HOME/.config/.flake8

if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi
