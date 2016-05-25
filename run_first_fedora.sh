#!/bin/bash
# run from root to install needed packages using apt

if [ "$(id -u)" != "0" ]; then
    echo "This script installs needed packages using dnf, please run as root."
    2>&1
    exit 1
fi

dnf -y remove vim-minimal
dnf -y install zsh tmux vim

update-alternatives --set editor $(which vim)
