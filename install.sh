#!/bin/sh

path=$(pwd)

ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/init.vim $HOME/.config/nvim/init.vim
ln -sf $path/.zshrc $HOME/.zshrc
ln -sf $path/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -sf $path/.tmux.conf $HOME/.tmux.conf
