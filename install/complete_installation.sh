#!/bin/zsh

function setup_warp() {
  set -l WARP_DIR $HOME/.dotfiles/config/warp/.warp

  curl -L -O https://github.com/catppuccin/warp/archive/main.zip
  unzip main.zip
  mv warp-main/themes/* $WARP_DIR/themes
  rm -rf main.zip warp-main
}


main
