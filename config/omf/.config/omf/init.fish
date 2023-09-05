# Disable greeting
function fish_greeting
end

# Enable vim mode
# fish_vi_key_bindings

starship init fish | source
source $ASDF_DATA_DIR/asdf.fish

source "$HOME/.dotfiles.local/init.fish"
