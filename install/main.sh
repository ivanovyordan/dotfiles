#!/usr/bin/env bash

declare -r DOTFILES_DIR=$HOME/.dotfiles
OS="$(uname -s)"

function download_dotfiles() {
  if [ "$OS" = "Darwin" ]; then
    xcode-select --install
  fi
  git clone https://github.com/ivanovyordan/dotfiles.git $DOTFILES_DIR
}

function install_mac_packages() {
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  cd $DOTFILES_DIR/install
  brew bundle install
  cd -
}

function install_linux_packages() {
  sudo pacman -Syu --noconfirm

  if ! command -v paru &> /dev/null; then
    sudo pacman -S --needed --noconfirm base-devel git
    local tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
    cd "$tmpdir/paru" && makepkg -si --noconfirm && cd -
    rm -rf "$tmpdir"
  fi

  paru -S --needed --noconfirm - < $DOTFILES_DIR/install/packages.txt
}

function install_packages() {
  if [ "$OS" = "Darwin" ]; then
    install_mac_packages
  elif [ "$OS" = "Linux" ]; then
    install_linux_packages
  fi
}

function link_dotfiles() {
  cd $DOTFILES_DIR/config
  stow -vSt ~ $(ls)
  cd -
}

function main() {
  download_dotfiles
  install_packages
  link_dotfiles

  fish $DOTFILES_DIR/install/complete_installation.fish
}

main
