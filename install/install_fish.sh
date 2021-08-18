#!/usr/bin/env bash

function install_fish() {
    brew install fish

    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
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

    wget -P $HOME/.config/fish/completions https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.fish
}

function main() {
    install_fish
    install_oh_my_fish
    install_prompt
}

main
