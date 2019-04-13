#!/bin/bash

set -eu

DOT_DIRECTORY="${HOME}/.dotfiles"
# DOT_CONFIG_DIRECTORY=".config"

cd ${DOT_DIRECTORY}

for f in .??*
do
  # ignore files
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
