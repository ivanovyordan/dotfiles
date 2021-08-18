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

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.profile

    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

function install_cli_packages() {
    brew install \
        bitwarden
        colordiff \
        ctags \
        curl \
        docker docker-compose kubectl kind minikube \
        git git-extras hub gh \
        neomutt isync msmtp mu khard \
        jq \
        fd ripgrep the_silver_searcher \
        tmux tmate \
        unzip \
        vault \
        wget \
        xclip

    if [ $1 == "Linux" ]; then
        brew unlink p11-kit
    fi
}

function install_desktop_packages() {
    if [ $1 == "Darwin" ]; then
        brew install --cask \
            dbeaver-community \
            discord \
            dropbox \
            firefox \
            rectangle \
            slack \
            spotify \
            tunnelblick \
            wire \
            zoom
    else
        flatpak install -y flathub \
            com.discordapp.Discord \
            com.dropbox.Client \
            com.slack.Slack \
            com.spotify.Client \
            com.wire.WireDesktop \
            io.dbeaver.DBeaverCommunity \  
            org.mozilla.firefox \ 
            us.zoom.Zoom
    fi
}


function main() {
    local kernel_name="$(uname -s | tr -d '\n')"

    if [ $kernel_name == "Darwin" ]; then
        install_mac_pacakge_managers
    else
        install_linux_package_managers
    fi

    install_cli_packages $kernel_name
    install_desktop_packages $kernel_name
}

main
