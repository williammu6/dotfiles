#!/bin/sh

path=$(pwd)
nvim_path=$HOME/.config/nvim

mkdir -p $nvim_path/plugin

ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/init.vim $nvim_path/init.vim
ln -sf $path/plugin $nvim_path/plugin
ln -sf $path/.zshrc $HOME/.zshrc
ln -sf $path/.tmux.conf $HOME/.tmux.conf
