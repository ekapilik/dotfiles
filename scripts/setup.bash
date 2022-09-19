#!/bin/bash
echo 'Adding scripts to $PATH and installing some tools.'

# create directory in home directory for scripts
mkdir -p $HOME/scripts

# stow scripts in this directory to ~/scripts
stow --ignore='setup.bash' -t $HOME/scripts scripts/

# add ~/scripts to PATH
echo 'if [ -d "$HOME/scripts" ] ; then
    PATH="$PATH:$HOME/scripts"
fi

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files"
  export FZF_DEFAULT_OPTS="-m --height 50% --border"
fi
' >> ~/.bashrc

# install packages
sudo apt update && sudo apt install -y \
    git-gui \
    htop \
    aha
