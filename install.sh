#!/usr/bin/env bash
#
# Runs all install scripts and syms all *.sym files to home

# Dirs with install scripts
dirs=( "tools" )

set -e

# Runs install scripts in dirs defined
install_tools () {
  for dir in ${dirs[@]}; do
    "./$dir/install.sh"
  done
}

# Run the whole lot
install_tools
