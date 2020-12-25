#!/usr/bin/env fish

function install_terminal
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
end

function install_themes
  git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
end

function main
  install_terminal
  install_themes
end

main
