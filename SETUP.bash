#!/bin/bash

sudo apt install vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
./appendBashrc.bash
./link_files.bash
./turnoff_bell.bash