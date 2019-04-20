#!/usr/bin/env bash

set -eu

if [ "$(uname)" == "Darwin" ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  OS='Win'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  OS='Win'
fi

DOT_DIRECTORY="${HOME}/dotfiles"
DOT_CONFIG_DIRECTORY=".config"

cd ${DOT_DIRECTORY}

for f in .??*
do
  # ignore files
  [ ${f} = ".git" ] && continue
  [ ${f} = ".gitignore" ] && continue
  [ ${f} = ${DOT_CONFIG_DIRECTORY} ] && continue
  if [ ${OS} == 'Mac' ] || [ ${OS} == 'Linux' ]; then
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
  elif [ ${OS} == 'Win' ]; then
    LINK_NAME=$(sed "s/\//\\\\/" ${HOME}/${f})
    TARGET=$(sed "s/\//\\\\/" ${DOT_DIRECTORY}/${f})
    cmd.exe /c "mklink /D ${LINK_NAME} ${TARGET}"
  fi
done

if [ ${OS} == 'Mac' ] || [ ${OS} == 'Linux' ]; then
  cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
  for file in `\find . -maxdepth 8 -type f`; do
    ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file:2} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file:2}
  done
fi

echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
