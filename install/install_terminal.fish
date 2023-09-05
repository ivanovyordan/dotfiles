#!/usr/bin/env fish

function install_font
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
    unzip -o -q -d $HOME/.local/share/fonts FiraCode.zip
    fc-cache -f -v
    rm -rf fira_code.zip
end

function install_emulators
    if test $argv[1] = Darwin
        brew install kitty
    else
        mkdir -p $HOME/.local/bin
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
        ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
        cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
        cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
        sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
        sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    end
end

function install_themes
    git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
end

function install_tmux_plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.local/share/tmux/plugins/tpm
    tmux source $HOME/.config/tmux/tmux.conf
end

function main
    install_font
    install_emulators $argv
    install_themes
    install_tmux_plugins
end

main $argv
