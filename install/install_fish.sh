#!/usr/bin/env bash

function install_fish() {
    if [[ $1 = "Darwin" ]]; then
        brew install fish
    else
        sudo apt install -y fish
    fi

    echo $(which fish) | sudo tee -a /etc/shells

    if [[ $1 = "Darwin" ]]; then
        chsh -s $(which fish) $USER
    else
        sudo chsh -s $(which fish) $USER
    fi
}

function install_oh_my_fish() {
    curl -L https://get.oh-my.fish > install
    fish install --config="${HOME}/.config/omf" -y
    rm install
}

function main() {
    install_fish $1
    install_oh_my_fish
}

main $1
