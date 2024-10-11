#!/usr/bin/env bash

declare -r DOTFILES_DIR=$HOME/.dotfiles
declare -r LOCAL_DOTFILES_DIR=$HOME/.dotfiles.local

function download_dotfiles() {
  xcode-select --install
  git clone https://github.com/ivanovyordan/dotfiles.git $DOTFILES_DIR
}

function create_local_dotfiles() {
  mkdir -p $LOCAL_DOTFILES_DIR
  touch $LOCAL_DOTFILES_DIR/init.fish
  touch $LOCAL_DOTFILES_DIR/init.vim
}

function install_homebrew() {
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

function install_packages() {
  cd $DOTFILES_DIR/install
  brew bundle install
  cd -
}

function link_dotfiles() {
  cd $DOTFILES_DIR/config
  stow -vSt ~ $(ls)
  cd -
}

function main() {
  download_dotfiles
  # create_local_dotfiles
  install_homebrew
  install_packages
  link_dotfiles

  # fish $DOTFILES_DIR/install/complete_installation.fish
  zsh $DOTFILES_DIR/install/complete_installation.sh
}

main
