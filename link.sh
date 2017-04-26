#!/usr/bin/env bash
USERNAME=$1
EMAIL=$2
HOME_DIR=$3
DOTFILES_DIR=$4

# Git
sed -e "s/AUTHORNAME/$USERNAME/g" \
    -e "s/AUTHOREMAIL/$EMAIL/g" \
    -e "s/GITHUB_USER/$USERNAME/g" \
    git/gitconfig.example > git/gitconfig

ln -fs $DOTFILES_DIR/git/gitconfig $HOME_DIR/.gitconfig
ln -fs $DOTFILES_DIR/git/gitignore $HOME_DIR/.gitignore

# Scripts
ln -fs $DOTFILES_DIR/scripts $HOME_DIR/.scripts

# Vim
ln -fs $DOTFILES_DIR/vim/vimrc $HOME_DIR/.vimrc

# Zsh
ln -fs $DOTFILES_DIR/zsh/zshrc $HOME_DIR/.zshrc

# XResources
ln -fs $DOTFILES_DIR/x/Xresources $HOME_DIR/.Xresources
