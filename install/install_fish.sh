#!/bin/bash

function install_package() {
  if [ $1 == "Darwin" ]; then
    install_mac
  elif [ $1 == "Linux" ]; then
    install_linux
  fi

  chsh -s $(which fish)
}

function install_mac() {
  brew install fish
}

function install_linux() {
  sudo apt-add-repository ppa:fish-shell/release-3 -y
  sudo apt install -y fish
}

function install_oh_my_fish() {
  curl -L https://get.oh-my.fish > install
  fish install --config="${HOME}/.dotfiles/omf" -y
  rm install
}

function install_prompt() {
  curl -fsSL https://starship.rs/install.sh > install
  bash install -f
  rm install
}

function main() {
  install_package $1
  install_oh_my_fish
  install_prompt
}

main $@
