#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ] \
|| [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  source ~/.bashrc_linux
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ] \
|| [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  source ~/.bashrc_win
fi
