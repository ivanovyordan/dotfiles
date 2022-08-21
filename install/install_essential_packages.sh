#!/usr/bin/env bash

function install_mac_pacakge_managers() {
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install_linux_package_managers() {
    # Update Packages
    sudo dnf upgrade --refresh -y

    # Enable RPM Fusion
    sudo dnf install -y \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

    sudo dnf group update -y core

    # Add flathub
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
    flatpak update --appstream

    # Faster downloads with dnf
    echo fastestmirror=True | sudo tee -a /etc/dnf/dnf.conf
    echo deltarpm=True | sudo tee -a /etc/dnf/dnf.conf
    echo max_parallel_downloads=10| sudo tee -a /etc/dnf/dnf.conf
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

function install_linux_aws_vault() {
    sudo curl -L -o /usr/local/bin/aws-vault https://github.com/99designs/aws-vault/releases/latest/download/aws-vault-linux-amd64
    sudo chmod 755 /usr/local/bin/aws-vault
}

function install_linux_bitwarden() {
  curl -L -o bw.zip 'https://vault.bitwarden.com/download/?app=cli&platform=linux'
  sudo unzip -j bw.zip -d /usr/local/bin/
  sudo chmod 755 /usr/local/bin/bw
  rm -rf bw.zip
}

function install_linux_docker() {
    cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

    sudo dnf install -y \
      kubectl \
      podman \
      podman-compose
}

function install_linux_hashicorp_tools() {
  sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo -y

  sudo dnf install -y \
      terraform \
      vault
}

function install_linux_cli_packages() {
     sudo dnf install -y \
      awscli \
      bat \
      colordiff \
      ctags \
      curl \
      direnv \
      exa \
      fd-find \
      git git-extras hub gh \
      httpie \
      jq \
      python3-tmuxp \
      ripgrep \
      sd \
      starship \
      stow \
      tealdeer \
      the_silver_searcher \
      tmux \
      unzip \
      visidata \
      wget \
      xclip

      install_linux_aws_vault
      install_linux_bitwarden
      install_linux_docker
      install_linux_hashicorp_tools
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

function install_linux_desktop_packages() {
    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
    sudo dnf install -y brave-browser

    flatpak install -y flathub \
        com.discordapp.Discord \
        com.dropbox.Client \
        com.slack.Slack \
        com.spotify.Client \
        io.dbeaver.DBeaverCommunity \
        org.gnome.Geary \
        us.zoom.Zoom
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
