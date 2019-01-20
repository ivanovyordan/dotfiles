#!/usr/bin/env fish

git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --no-bash --no-zsh --key-bindings --completion --update-rc

set -Ux FZF_CTRL_T_OPTS "--preview 'highlight_item {}'"
set -Ux FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
