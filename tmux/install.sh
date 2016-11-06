#!/usr/bin/env bash
#
# Installs tmux and symlinks tmux.conf

echo 'Running tmux install script'

echo 'Installing tmux with Homebrew'
brew install tmux

echo 'Cloning tmux plugin manager'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
