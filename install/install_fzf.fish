#!/usr/bin/env fish

function install_fzf
    if test $argv[1] = "Darwin"
        brew install fzf

        set brew_prefix (brew --prefix)
        $brew_prefix/opt/fzf/install --no-bash --no-zsh --key-bindings --completion --update-rc
    else
        nix-env -iA nixpkgs.fzf
    end
end

function set_env_vars
    set -Ux FZF_CTRL_T_OPTS "--reverse --preview 'highlight_item {}'"
    set -Ux FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
end

function main
    install_fzf
    set_env_vars
end

main $argv[1]
