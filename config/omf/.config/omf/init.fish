# Disable greeting
function fish_greeting
end

# Enable vim mode
# fish_vi_key_bindings
alias mux="tmuxinator"

starship init fish | source

source "$HOME/.dotfiles.local/init.fish"
