#!/usr/bin/env bash

declare -r GITHUB_REPOSITORY=ivanovyordan/dotfiles
declare -r DOTFILES_ORIGIN=git@github.com:$GITHUB_REPOSITORY.git
declare -r DOTFILES_TARBALL=https://github.com/$GITHUB_REPOSITORY/tarball/master
declare -r DOTFILES_DIRECTORY=$HOME/.dotfiles
declare -r LOCAL_DOTFILES_DIRECTORY=$HOME/.dotfiles.local

function request_sudo() {
    sudo -v &> /dev/null

    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &
}

function download() {
    local source=$1
    local target=$2

    if command -v curl &> /dev/null; then
        curl -LsSo $target $source &> /dev/null
    else
        wget -qO $target $source &> /dev/null
    fi
}

function download_dotfiles() {
    tmp_dotfiles=$(mktemp /tmp/XXXXXXXX)
    download $DOTFILES_TARBALL $tmp_dotfiles

    if [ -e $DOTFILES_DIRECTORY ]; then
        mv $DOTFILES_DIRECTORY $DOTFILES_DIRECTORY.back
    fi

    mkdir -p $DOTFILES_DIRECTORY
    tar -zxf $tmp_dotfiles --strip-components 1 -C $DOTFILES_DIRECTORY
    rm -f $tmp_dotfiles

    cd $DOTFILES_DIRECTORY/install
}

function create_local_dotfiles() {
    mkdir -p $LOCAL_DOTFILES_DIRECTORY
    touch $LOCAL_DOTFILES_DIRECTORY/init.fish
    touch $LOCAL_DOTFILES_DIRECTORY/init.vim
}

function link_dotfiles() {
    mkdir -p $HOME/.config/{tmux,ranger,pypoetry}
    ln -s $DOTFILES_DIRECTORY/config/nvim $HOME/.config/nvim
    ln -s $DOTFILES_DIRECTORY/config/git/gitconfig $HOME/.gitconfig
    ln -s $DOTFILES_DIRECTORY/config/npmrc $HOME/.npmrc
    ln -s $DOTFILES_DIRECTORY/config/pryrc $HOME/.pryrc
    ln -s $DOTFILES_DIRECTORY/config/poetry.toml $HOME/.config/pypoetry/config.toml
    ln -s $DOTFILES_DIRECTORY/config/starship.toml $HOME/.config/starship.toml
    ln -s $DOTFILES_DIRECTORY/config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
    ln -s $DOTFILES_DIRECTORY/config/ranger/rc.conf $HOME/.config/ranger/rc.conf
    ln -s $DOTFILES_DIRECTORY/config/kitty.conf $HOME/.config/kitty/kitty.conf

    ln -s $DOTFILES_DIRECTORY/config/mutt/muttrc $HOME/.muttrc
    ln -s $DOTFILES_DIRECTORY/config/mutt/mbsyncrc $HOME/.mbsyncrc
    ln -s $DOTFILES_DIRECTORY/config/mutt/msmtprc $HOME/.msmtprc
}

function install_packages() {
    bash ./install_packages.sh
    bash ./install_fish.sh
    fish ./install_node.fish
    fish ./install_golang.fish
    fish ./install_python.fish
    fish ./install_ruby.fish
    fish ./install_terraform.fish
    fish ./install_fzf.fish
    fish ./install_vim.fish
    fish ./install_ranger.fish
    fish ./install_terminal.fish
    fish ./install_gaming.fish
}

function main() {
    request_sudo
    download_dotfiles
    create_local_dotfiles
    link_dotfiles
    install_packages

    fish ./complete_installation.fish "$DOTFILES_DIRECTORY" "$DOTFILES_ORIGIN"
}

main
