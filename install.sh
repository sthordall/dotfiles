#!/usr/bin/env bash

# Packages
PACKAGES=(
  arduino-cli
  ccat
  git
  go
  python3.7
  rsync
  tmux
  vim
  fish
  zsh
)

echo "Operating System: ${OSTYPE}"

if [[ $OSTYPE == "linux-gnu"* ]]; then
  for package in ${PACKAGES[@]}; do
    if ! hash $package &>/dev/null; then
      echo "Installing package: $package"
      sudo apt install $package
    fi
  done
fi

if [[ $OSTYPE == "darwin"* ]]; then
  if ! hash brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  for package in ${PACKAGES[@]}; do
    if ! hash $package &>/dev/null; then
      echo "Installing package: $package"
      brew install $package
    fi
  done
fi

# ZSH
ZSH_HOME=~/.oh-my-zsh
ZSH_PLUGINS=$ZSH_HOME/custom/plugins

if [ ! -d $ZSH_HOME ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

mkdir -p $ZSH_PLUGINS
if [ ! -d $ZSH_PLUGINS/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    $ZSH_PLUGINS/zsh-autosuggestions
fi
if [ ! -d $ZSH_PLUGINS/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_PLUGINS}/zsh-syntax-highlighting
fi

# VIM
if [ ! -d ~/.vim/autoload ]; then
  mkdir -p ~/.vim/autoload
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#TMUX
if [ ! -d ~/.tmux/plugins/tpm ]; then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm \
    ~/.tmux/plugins/tpm
fi

# GO
#if [ command -v go >/dev/null 2>&1 ]; then
#fi
