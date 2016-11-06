#!/usr/bin/env bash
#
# Installs oh-my-zsh, bullet-train theme and powerline fonts

echo 'Running ZSH install script'

echo 'Installing ZSH with Homebrew'
brew install zsh

echo 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'Installing bullet-train theme'
curl -fsSL https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme > ~/.oh-my-zsh/themes/bullet-train.zsh-theme

echo 'Installing PowerLine fonts'
git clone https://github.com/powerline/fonts.git fonttmp
sh -c fonttmp/install.sh
rm -rf fonttmp
