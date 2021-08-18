#!/usr/bin/env fish

function set_environment_variables
    set -Ux EDITOR "nvim"
    set -Ua fish_user_paths $HOME/.dotfiles/bin
end

function create_git_repository
    set DOTFILES_DIRECTORY $argv[1]
    set DOTFILES_ORIGIN $argv[2]

    cd $DOTFILES_DIRECTORY
    git init
    git remote add origin $DOTFILES_ORIGIN
    git pull
    cd -
end

function main
    set_environment_variables
    create_git_repository $argv
end

main $argv
