# Disable greeting
function fish_greeting
end

# Enable vim mode
# fish_vi_key_bindings
alias mux="tmuxinator"

zoxide init --cmd cd fish | source
starship init fish | source

source "$HOME/.dotfiles.local/init.fish"
