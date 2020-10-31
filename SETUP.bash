#!/bin/bash

sudo apt update
sudo apt install -y vim tmux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
./appendBashrc.bash
./link_files.bash
./turnoff_bell.bash
