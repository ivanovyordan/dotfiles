#!/usr/bin/env fish

function enable_fish
    fish_add_path /opt/homebrew/bin
    fish_add_path $HOME/.dotfiles/bin

    echo (which fish) | sudo tee -a /etc/shells
    chsh -s (which fish) $USER
end

function set_environment_vars
    set -Ux EDITOR "nvim"
    set -Ux FZF_CTRL_T_OPTS "--reverse --preview 'bat --style=full --color=always --highlight-line {2} {1}'"
    set -Ux FZF_DEFAULT_COMMAND "fd --hidden --follow"
end

function install_tmux_plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.local/share/tmux/plugins/tpm
    tmux source $HOME/.config/tmux/tmux.conf
end

function install_oh_my_fish
    curl -Lo install_omf.fish https://get.oh-my.fish
    fish install_omf.fish --config="$HOME/.config/omf" -y
    rm install_omf.fish
end

function setup_ai
  uv tool install aider-chat
  uv tool install playwright
  playwright install --with-deps chromium

  set -Ux AIDER_AUTO_COMMITS false
  set -Ux AIDER_DARK_MODE true
  set -Ux AIDER_GITIGNORE false
  set -Ux AIDER_SHOW_DIFFS true
  set -Ux AIDER_SHOW_MODEL_WARNINGS false
  set -Ux OPENAI_API_KEY lm-studio
end


function main
    enable_fish
    set_environment_vars
    setup_ai
    install_tmux_plugins
    install_oh_my_fish
end

main
