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

    flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
}


install_mac_cli_packages() {
    brew install \
        aws-vault \
        awscli \
        bat \
        bitwarden-cli \
        curl \
        direnv \
        exa \
        fd \
        git git-extras hub gh \
        httpie \
        jq \
        podman podman-compose kubeerneetes-cli \
        ripgrep \
        saulpw/vd/visidata \
        stow \
        tealdeer \
        terraform \
        sd \
        starship \
        the_silver_searcher \
        tmux tmuxp \
        universal-ctags \
        unzip \
        vault \
        wget \
        xclip
}


function install_linux_docker() {
    local UBUNTU_CODENAME=$(cat /etc/os-release | grep UBUNTU_CODENAME | awk -F= '{print $2}')

    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$UBUNTU_CODENAME")" stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

        sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        sudo usermod -aG docker $USER
        newgrp docker

}


function install_linux_cli_packages() {
     sudo apt install -y \
      awscli \
      bat \
      colordiff \
      curl \
      direnv \
      exa \
      fd-find \
      git git-extras hub gh \
      httpie \
      jq \
      python3-tmuxp \
      ripgrep \
      silversearcher-ag \
      stow \
      tmux \
      xclip

      install_linux_docker

    sudo ln -s $(which batcat) /usr/local/bin/bat
    curl -sS https://starship.rs/install.sh | sh
}


function install_mac_desktop_packages() {
    brew install --cask \
        dbeaver-community \
        discord \
        dropbox \
        rancher \
        rectangle \
        slack \
        spotify \
        tunnelblick \
        zoom
}


function install_asdf() {
    mkdir -p $HOME/.apps
    git clone https://github.com/asdf-vm/asdf.git ~/.apps/asdf

    . "$HOME/.apps/asdf/asdf.sh"
}


function install_linux_desktop_packages() {
    flatpak install -y flathub \
        com.discordapp.Discord \
        com.dropbox.Client \
        org.mozilla.firefox \
        com.slack.Slack \
        com.spotify.Client
}


function main() {
    if [[ $1 = "Darwin" ]]; then
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
