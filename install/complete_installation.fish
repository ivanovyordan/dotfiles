#!/usr/bin/env fish

set -Ux LC_ALL "en_US.UTF-8"
set -Ux LANG "en_US.UTF-8"
set -Ux EDITOR "nvim"
set -Ua fish_user_paths $HOME/.dotfiles/bin

gopass-jsonapi configure --browser=firefox --path=$HOME/.local --global=false
