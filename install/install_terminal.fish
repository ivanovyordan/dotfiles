#!/usr/bin/env fish

function install_font
    curl --fail --location --show-error https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip --output fira_code.zip
    unzip -o -q -d $HOME/.local/share/fonts fira_code.zip
    fc-cache -f -v
    rm -rf fira_code.zip
end

function install_terminal
    if test $kernel_name = "Linux"
      sudo apt install -y alacritty
    else
      brew install alacritty
    end
end

function install_themes
    git clone --depth 1 git@github.com:eendroroy/alacritty-theme.git ~/.config/alacritty/alacritty-theme
end

function install_tmux_plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.local/share/tmux/plugins/tpm
    tmux source $HOME/.config/tmux/tmux.conf
    tmux send-keys C-b I
end

function main
    local kernel_name="$(uname -s | tr -d '\n')"

    install_font
    install_terminal $kernel_name
    install_themes
    install_tmux_plugins
end

main
