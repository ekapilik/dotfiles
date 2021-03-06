# dotfiles
.config files for personalized linux usage

## Installation
* Set Up Vundle [`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`](https://github.com/VundleVim/Vundle.vim)
* Install VIM plugins: [$ sudo vim +PluginInstall]

## Configuration Files

### .bashrc

* vime - Open vim in Exploration mode
* git shortcuts (gs, gd, gg, gm, gl)
* git editor definition (vim)
* parse_git_branch() defined for use in PS1 declaration

### .gitconfig

* user.name defined
* user.email defined
* editor defined

### .tmux.conf

* uses colored termimal
* default shell defined as /bin/bash

### .vimrc

* installs plug-in manager (Vundle)
* Plugin 'itchyny/lightline.vim'
* Plugin 'joshdick/onedark.vim'
* Plugin 'scrooloose/nerdtree'
* F6 toggles NERDTree
* F4 focuses to NERDTree
* turn on syntax highlighting
* preserve transparent background
* search settings
* line wrapping
* tab navigation shortcuts
* tap character spacing defined
* C style kernel
* number lines on
* WinMove definitions

## Scripts

### appendBashrc.sh

* appends .bashrc from this repo to ~/.bashrc

### link_files.sh

* remove old vimrc config
* update to new vimrc config
* remove old tmux.conf
* update to new tmux.conf

### turnoff_bell.sh

* uncomments "set bell-style none" to turn off the bell

