#!/usr/bin/env fish

function install_font
    curl --fail --location --show-error https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip --output fira_code.zip
    unzip -o -q -d $HOME/.local/share/fonts fira_code.zip
    fc-cache -f -v
    rm -rf fira_code.zip
end


function install_kitty
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin


    if test $argv[1] = "Linux"
        ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
        cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
        cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
        sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
        sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    end
end

function install_alacritty
    if test $argv[1] = "Darwin"
        brew install alacritty
    else
        sudo add-apt-repository -y ppa:aslatter/ppa
        sudo apt install -y alacritty
    end
end

function install_terminal
    install_kitty
    install_alacritty $argv[1]
end

function install_themes
    git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
    git clone --depth 1 git@github.com:eendroroy/alacritty-theme.git ~/.config/alacritty/alacritty-theme
end

function install_tmux_plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.local/share/tmux/plugins/tpm
    tmux source $HOME/.config/tmux/tmux.conf
    tmux send-keys C-b I
end

function main
    install_font
    install_terminal $argv[1]
    install_themes
    install_tmux_plugins
end

main $argv[1]
