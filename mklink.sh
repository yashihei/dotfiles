#!/usr/bin/env bash

set -eu

mklink() {
  rm "../$1"
  cmd.exe /c "mklink /H ..\\$1 $1"
}

mklink .bash_aliases
mklink .bash_profile
mklink .bashrc
mklink .bashrc_win
mklink .gitconfig
mklink .ideavimrc
mklink .irbrc
mklink .pryrc
mklink .vimrc
