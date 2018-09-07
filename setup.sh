#!/usr/bin/env bash

if [ ! -d /home/sthordall/.oh-my-zsh ]
then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d /home/sthordall/.vim/autoload ]
then
  curl -fLo /home/sthordall/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

