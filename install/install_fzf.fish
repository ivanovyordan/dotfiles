#!/usr/bin/env fish

function install_fzf
    if test $argv[1] = "Darwin"
        brew install fzf

        set brew_prefix (brew --prefix)
        $brew_prefix/opt/fzf/install --no-bash --no-zsh --key-bindings --completion --update-rc
    else
        sudo apt install -y fzf
    end
end

function set_env_vars
    set -Ux FZF_CTRL_T_OPTS "--reverse --preview 'bat --style=full --color=always --highlight-line {2} {1}'"
    set -Ux FZF_DEFAULT_COMMAND "fd --hidden --follow"
end

function main
    set_env_vars
    install_fzf $argv
end

main $argv
