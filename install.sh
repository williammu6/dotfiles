#!/bin/sh

path=$(pwd)
nvim_path=$HOME/.config/nvim

mkdir -p $nvim_path/plugin

ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/init.vim $HOME/.config/nvim/init.vim
ln -sf $path/.zshrc $HOME/.zshrc
ln -sf $path/.tmux.conf $HOME/.tmux.conf
