#! /usr/bin/env bash

sudo apt update && sudo apt install -y python3-neovim ctags fzf ripgrep
__check_and_install__ nvim ${apt_updated:-false} 
