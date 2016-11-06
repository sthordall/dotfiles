#!/usr/bin/env bash
#
# Installs vim and vundle

echo 'Running vim install script'

echo 'Install vim from Homebrew'
brew install vim

echo 'Clone vundle into .vim'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Installing plugins'
vim +PluginInstall +qall
