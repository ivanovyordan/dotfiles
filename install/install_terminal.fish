#!/usr/bin/env fish

function install_terminal
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
end

function install_themes
  git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
end

function install_tmux_plugins
  git clone https://github.com/tmux-plugins/tpm $HOME/.local/share/tmux/plugins/tpm
  tmux source $HOME/.config/tmux/tmux.conf
  tmux send-keys C-b I
end

function main
  install_terminal
  install_themes
  install_tmux_plugins
end

main
