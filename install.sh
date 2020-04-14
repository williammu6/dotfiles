#!/bin/sh

path=$(pwd)

ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/init.vim $HOME/.config/nvim/init.vim
ln -sf $path/.zshrc $HOME/.zshrc
