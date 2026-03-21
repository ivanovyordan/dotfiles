#!/usr/bin/env fish

function enable_fish
    if test (uname -s) = "Darwin"
        fish_add_path /opt/homebrew/bin
    end
    fish_add_path $HOME/.dotfiles/bin

    if not grep -q (which fish) /etc/shells
        echo (which fish) | sudo tee -a /etc/shells
    end
    chsh -s (which fish) $USER
end

function set_environment_vars
    set -Ux EDITOR "nvim"
    set -Ux FZF_CTRL_T_OPTS "--reverse --preview 'bat --style=full --color=always --highlight-line {2} {1}'"
    set -Ux FZF_DEFAULT_COMMAND "fd --hidden --follow"
end

function install_oh_my_fish
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install_omf.fish
    fish install_omf.fish --config=~/.config/omf -y
    rm install_omf.fish
end


function main
    enable_fish
    set_environment_vars
    install_oh_my_fish
end

main
