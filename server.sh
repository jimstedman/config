#!/bin/bash
# set up dotfiles on new installation

git clone --recursive https://github.com/jimstedman/prezto.git ~/.zprezto
for rcfile in ~/.zprezto/runcoms/z*; do
    rcfilename=$(echo $rcfile |cut -d'/' -f 6)
    ln -fs $rcfile ~/.${rcfilename:t}
done

./wd_install.sh

cp -rf .vim ~
cp .vimrc ~
cp .Xresources ~ 
cp .tmux.conf ~
cp .t_session ~

# password req'd to change shell
chsh -s "$(which zsh)"
