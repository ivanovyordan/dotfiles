#!/bin/bash

function update_system() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean
}

function install_apt_packages() {
  sudo apt install -y \
    colordiff \
    fd-find \
    firefox \
    git \
    git-extras \
    highlight \
    jq \
    pass \
    ranger \
    silversearcher-ag \
    snapd \
    software-properties-common \
    steam-installer \
    tmux \
    unzip \
    virtualbox
}

function install_flatpak_packages() {
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  flatpak install -y flathub \
    com.discordapp.Discord \
    com.slack.Slack \
    com.spotify.Client \
    us.zoom.Zoom \
    com.dropbox.Client \
}

function install_snap_packages() {
  sudo snap install hub --classic
}

function install_tool() {
  TOOL=$1
  VERSION=$(curl -s "https://releases.hashicorp.com/${TOOL}/" | grep "/${TOOL}/" | head -1 | awk -F '/' '{print $3}')

  curl -so ${TOOL}.zip https://releases.hashicorp.com/${TOOL}/${VERSION}/${TOOL}_${VERSION}_linux_amd64.zip

  unzip "${TOOL}.zip"
  mv $TOOL "${HOME}/.local/bin"
  rm "${TOOL}.zip"
}

function install_hashicorp_tools() {
  mkdir -p "${HOME}/.local/bin"

  install_tool "vagrant"
  install_tool "terraform"
  install_tool "vault"
}

function install_drivers() {
  sudo ubuntu-drivers autoinstall
}

function main() {
  update_system
  add_ppa_repositories
  install_apt_packages
  install_flatpak_packages
  install_snap_packages
  install_hashicorp_tools
  install_drivers
}

main
