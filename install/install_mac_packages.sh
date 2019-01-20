#!/bin/bash

function install_homebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_core_packages() {
  brew install \
    colordiff \
    fd \
    git \
    git-extras \
    highlight \
    hub \
    jq \
    pass \
    ranger \
    terraform \
    the_silver_searcher \
    tmux \
    unzip \
    vault \
    wget
}

function install_cask_packages() {
  brew cask install \
    discord \
    dropbox \
    firefox \
    iterm2 \
    slack \
    spotify \
    tunnelblick \
    vagrant \
    virtualbox \
    zoomus
}

function main() {
  xcode-select --all
  install_homebrew
  install_core_packages
  install_cask_packages
}

main
