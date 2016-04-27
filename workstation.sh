#!/bin/bash
# set up dotfiles on new installation

git clone --recursive https://github.com/jimstedman/prezto.git ~/.zprezto
setopt EXTENDED_GLOB
for rcfile in ~/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

./wd_install.sh

cp -rf .vim ~
cp .*rc ~
cp .Xresources ~ 
cp .tmux.conf ~
cp .t_session ~

# password req'd to change shell
chsh -s "$(which zsh)"
