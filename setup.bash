#! /usr/bin/env bash

# Credit: https://gitlab.com/kunaltyagi/dotfiles/-/blob/master/setup.bash

git submodule init && git submodule update

apt_updated=false;

# Don't send multiple arguments to this function
function __check_and_install__()
{
    echo 'Checking for '$1
    # use `apt list $1 | grep installed` instead?
    which $1 2>&1 1> /dev/null
    if [ $? -ne 0 ]; then
        if [ ${2:-true} ]; then
            echo '$ sudo apt update'
            sudo apt update
            apt_updated=true
        fi
        echo '$ sudo apt install -y '${3-$1}
        sudo apt install -y ${3-$1}
    fi
    echo $1 "is installed"
}

if [ "$#" -ne 0 ]; then
    stow -t $HOME $@
    exit 0
fi

__check_and_install__ stow $apt_updated
__check_and_install__ readlink $apt_updated
__check_and_install__ dirname $apt_updated coreutils

pushd `dirname "$(readlink -f "$0")"` 2>&1 1> /dev/null
for dir in $(ls -d *)
do
    [ ! -d "$dir" ] && continue
    [ "$dir" == 'scripts' ] && continue
    if [ "$dir" != 'system' ]; then
        echo 'Installing '$dir
        stow --ignore='setup.bash' -t $HOME $dir
    fi

    pushd $dir 2>&1 1> /dev/null
    if [ -f "setup.bash" ];
    then
        echo "Delegating futher installation"
        source "setup.bash"
    fi
    popd 2>&1 1> /dev/null
done

popd 2>&1 1> /dev/null
unset $apt_updated

# add scripts to ~
source scripts/setup.bash
