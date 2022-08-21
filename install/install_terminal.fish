#!/usr/bin/env fish

function install_font
    http --download https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip -o fira_code.zip
    unzip -o -q -d $HOME/.local/share/fonts fira_code.zip
    fc-cache -f -v
    rm -rf fira_code.zip
end

function install_emulators
    if test $argv[1] = Darwin
        brew install \
            alacritty \
            kitty
    else
        sudo dnf install -y \
            alacritty \
            kitty
    end
end

function install_themes
    git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
    git clone --depth 1 https://github.com/eendroroy/alacritty-theme ~/.config/alacritty/alacritty-theme
end

function install_tmux_plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.local/share/tmux/plugins/tpm
    tmux source $HOME/.config/tmux/tmux.conf
    tmux send-keys C-b I
end

function main
    install_font
    install_emulators $argv
    install_themes
    install_tmux_plugins
end

main $argv
