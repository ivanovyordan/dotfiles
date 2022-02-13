#!/usr/bin/env bash

function install_mac_pacakge_managers() {
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install_linux_package_managers() {
    sudo apt update
    sudo apt upgrade -y
    sudo apt dist-upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean

    sh <(curl -L https://nixos.org/nix/install) --daemon
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}


install_mac_cli_packages() {
    brew install \
        aws-vault \
        awscli \
        bitwarden-cli \
        colordiff \
        curl \
        direnv \
        git git-extras hub gh \
        jq \
        saulpw/vd/visidata \
        terraform \
        the_silver_searcher \
        tmux tmuxinator \
        universal-ctags \
        unzip \
        vault \
        wget \
        xclip
}

function install_linux_cli_packages() {
    nix -iA \
        nixpkgs.aws-vault \
        nixpkgs.awscli2 \
        nixpkgs.bitwarden-cli \
        nixpkgs.colordiff \
        nixpkgs.curl \
        nixpkgs.direnv \
        nixpkgs.docker nixpkgs.docker-compose nixpkgs.kubectl nixpkgs.kind \
        nixpkgs.git nixpkgs.git-extras nixpkgs.hub nixpkgs.gh \
        nixpkgs.jq \
        nixpkgs.silver-searcher \
        nixpkgs.terraform \
        nixpkgs.tmux nixpkgs.tmuxinator \
        nixpkgs.universal-ctags \
        nixpkgs.unzip \
        nixpkgs.vault \
        nixpkgs.visidata \
        nixpkgs.wget \
        nixpkgs.xclip
}


function install_mac_desktop_packages() {
    brew install --cask \
        dbeaver-community \
        discord \
        dropbox \
        firefox \
        rancher \
        rectangle \
        slack \
        spotify \
        tunnelblick \
        zoom
}

function install_linux_desktop_packages() {
    flatpak install -y flathub \
        com.discordapp.Discord \
        com.dropbox.Client \
        org.freedesktop.Platform.ffmpeg-full \
        com.slack.Slack \
        com.spotify.Client \
        io.dbeaver.DBeaverCommunity \
        org.mozilla.firefox \
        us.zoom.Zoom
}


function main() {
    if [ $1 == "Darwin" ]; then
        install_mac_package_managers $1
        install_mac_cli_packages $1
        install_mac_desktop_packages $1
    else
        install_linux_package_managers $1
        install_linux_cli_packages $1
        install_linux_desktop_packages $1
    fi
}

main $1
