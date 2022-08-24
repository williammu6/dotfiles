#!/bin/sh

path=$(pwd)
nvim_path=$HOME/.config/nvim

# Packer setup
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

