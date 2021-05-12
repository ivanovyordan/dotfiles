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

    sudo apt install -y build-essential curl file git
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

    sudo apt install -y flatpak gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

function install_cli_packages() {
    brew install \
        colordiff \
        ctags \
        curl \
        docker docker-compose kubectl kind minikube \
        git git-extras hub gh \
        bat highlight \
        neomutt isync msmtp mu khard \
        jq \
        pass gopass gopass-jsonapi \
        fd ripgrep the_silver_searcher \
        tmux tmate \
        unzip \
        vault \
        wget \
        xclip
}

function install_desktop_packages() {
    if [ $1 == "Darwin" ]; then
        brew cask install \
            discord \
            dropbox \
            firefox \
            rectangle \
            slack \
            spotify \
            tunnelblick \
            zoom
    else
        flatpak install -y flathub \
            com.discordapp.Discord \
            com.dropbox.Client \
            com.slack.Slack \
            com.spotify.Client \
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

    install_cli_packages
    install_desktop_packages $kernel_name
}

main
