#!/usr/bin/env bash

function prepare_fish() {
    mkdir -p $HOME/.dotfiles.local
    touch $HOME/.dotfiles.local/init.fish
}

function install_fish() {
    if [[ $1 = "Darwin" ]]; then
        brew install fish
    else
        sudo dnf install -y fish
    fi

    echo $(which fish) | sudo tee -a /etc/shells

    if [[ $1 = "Darwin" ]]; then
        chsh -s $(which fish) $USER
    else
        sudo lchsh $(which fish) $USER
    fi
}

function install_oh_my_fish() {
    curl -L https://get.oh-my.fish > install
    fish install --config="${HOME}/.config/omf" -y
    rm install
}

function main() {
    prepare_fish
    install_fish $1
    install_oh_my_fish
}

main $1
