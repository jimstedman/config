#!/bin/bash
# run from root to install needed packages using apt

if [ "$(id -u)" != "0" ]; then
    echo "This script installs needed packages using apt-get, please run as root."
    2>&1
    exit 1
fi

apt-get -y install zsh tmux vim

update-alternatives --set editor $(which vim)
