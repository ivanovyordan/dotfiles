#!/usr/bin/env bash

function install_fish() {
    if [ $1 == "Darwin" ]; then
        brew install fish
    else
        nix-env -iA nixpkgs.fish
    fi

    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish) $USER
}

function install_oh_my_fish() {
    curl -L https://get.oh-my.fish > install
    fish install --config="${HOME}/.dotfiles/omf" -y
    rm install
}

function install_prompt() {
    curl -fsSL https://starship.rs/install.sh > install
    bash install -f
    rm install
}

function main() {
    install_fish $1
    install_oh_my_fish
    install_prompt
}

main $1
