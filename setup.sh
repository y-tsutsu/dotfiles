#!/bin/bash

rm $HOME/.bashrc

DOTFILES_DIR=`pwd`
DOT_FILES=( .emacs.d .bashrc .tmux.conf .zshenv .zshrc vscrunner )

for file in ${DOT_FILES[@]}
do
    if [ -d $DOTFILES_DIR/$file ]; then
        ln -s $DOTFILES_DIR/$file $HOME
    else
        ln -s $DOTFILES_DIR/$file $HOME/$file
    fi
done

if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

ln -s $DOTFILES_DIR/terminator-cjk.desktop $HOME/.local/share/applications/terminator-cjk.desktop
