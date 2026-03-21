# Disable greeting
function fish_greeting
end

# fzf
fzf --fish | source

zoxide init --cmd cd fish | source
starship init fish | source
