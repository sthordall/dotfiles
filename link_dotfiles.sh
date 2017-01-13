#! /bin/bash
USERNAME = $1
EMAIL = $2
HOME_DIR = $3

# Git
sed -e "s/AUTHORNAME/$USERNAME/g" \
    -e "s/AUTHOREMAIL/$EMAIL/g" \
    -e "s/GITHUB_USER/$USERNAME/g" \
    git/gitconfig.example > git/gitconfig

ln -fs git/gitconfig $HOME_DIR/.gitconfig
ln -fs git/gitignore $HOME_DIR/.gitignore

# Vim
ln -fs vim/vimrc $HOME_DIR/.vimrc

# Zsh
ln -fs zsh/zshrc $HOME_DIR/.zshrc
