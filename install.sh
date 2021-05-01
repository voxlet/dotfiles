#!/usr/bin/env zsh

set -euxo pipefail

links=(
  Karabiner ~/.config
  Neovim ~/.config
  Spacemacs ~
  Zsh ~
)

dotfiles::link() {
  from=$1
  to=$2

  ln -sfn ${PWD}/${from}/*(D) "${to}/"
}

for from to in ${links[@]}; do
  dotfiles::link ${from} ${to}
done

