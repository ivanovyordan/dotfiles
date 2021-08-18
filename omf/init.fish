# Disable greeting
function fish_greeting
end

# Enable vim mode
# fish_vi_key_bindings

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)
starship init fish | source

source "$HOME/.dotfiles.local/init.fish"
