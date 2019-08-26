# dotfiles
.config files for personalized linux usage

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

* installs plug-in manager (vim-plug)
* installs rust-lang/rust.vim plugin
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

