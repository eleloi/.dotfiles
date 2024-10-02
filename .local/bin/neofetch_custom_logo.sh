#!/bin/bash

# [[ ! -o login ]] && exit 0

if command -v fastfetch &> /dev/null; then
    cmd="fastfetch"
elif command -v neofetch &> /dev/null; then
    cmd="neofetch"
else
    echo "No neofetch or fastfetch found"
    exit 1
fi

source /etc/os-release

case $ID in
    arch)
        logo="arch2"
        ;;
    ubuntu)
        logo="ubuntu_old2_small"
        ;;
esac

if [[ -n $logo ]]; then
    $cmd --logo "$logo"
else
    $cmd
fi

