#!/bin/bash

set -eu

DOT_DIRECTORY="${HOME}/.dotfiles"
DOT_CONFIG_DIRECTORY=".config"

cd ${DOT_DIRECTORY}

for f in .??*
do
  # ignore files
  [ ${f} = ".git" ] && continue
  [ ${f} = ".gitignore" ] && continue
  [ ${f} = ${DOT_CONFIG_DIRECTORY} ] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
for file in `\find . -maxdepth 8 -type f`; do
    ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file:2} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file:2}
done

echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
