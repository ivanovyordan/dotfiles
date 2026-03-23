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

  grep -v '^\s*#\|^\s*$' $DOTFILES_DIR/install/packages.txt | paru -S --needed --noconfirm -

  setup_ai
}

function setup_ai() {
  systemctl --user enable --now ollama
  systemctl --user enable --now hyprvoice.service
  systemctl --user enable --now ydotool

  ollama run qwen3.5
  hyprvoice model download large-v3-turbo
}

function install_packages() {
  if [ "$OS" = "Darwin" ]; then
    install_mac_packages
  elif [ "$OS" = "Linux" ]; then
    install_linux_packages
  fi
}

function configure_firewall() {
  if [ "$OS" != "Linux" ]; then
    return
  fi

  sudo ufw allow 1714:1764/tcp
  sudo ufw allow 1714:1764/udp
  sudo ufw reload
}

function link_dotfiles() {
  cd $DOTFILES_DIR/config
  stow -vSt ~ $(command ls)
  cd -
}

function main() {
  download_dotfiles
  install_packages
  configure_firewall
  link_dotfiles

  fish $DOTFILES_DIR/install/complete_installation.fish
}

main
