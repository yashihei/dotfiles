#!/usr/bin/env bash

set -eu

mklink() {
  cmd.exe /c 'mklink /D ..\$[$1] $[$2]'
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
