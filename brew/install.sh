#!/usr/bin/env bash
#
# Homebrew

echo 'Running Homebrew install script'

# Check for Homebrew
if test ! $(which brew)
then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
    
exit 0
