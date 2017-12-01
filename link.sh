#!/usr/bin/env bash
USERNAME=$1
EMAIL=$2
HOME_DIR=$3
DOTFILES_DIR=$4

# setup git config
sed -e "s/AUTHORNAME/$USERNAME/g" \
    -e "s/AUTHOREMAIL/$EMAIL/g" \
    -e "s/GITHUB_USER/$USERNAME/g" \
    git/gitconfig.example > git/gitconfig

function linkdot {
  ln -fs $DOTFILES_DIR/$1 $HOME_DIR/$2
}

linkdot spacemacs/spacemacs .spacemacs
linkdot git/gitconfig .gitconfig
linkdot git/gitignore .gitignore
linkdot scripts .scripts
linkdot tmux/tmux.conf .tmux.conf
linkdot vim/vimrc .vimrc
linkdot x/Xresources .Xresources
linkdot zsh/zshrc .zshrc
