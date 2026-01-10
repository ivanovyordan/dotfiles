export EDITOR='nvim'

# local bins
export PATH="${HOME}/.local/bin:${PATH}"

# fzf
export EDITOR="nvim"
export FZF_CTRL_T_OPTS="--reverse --preview 'bat --style=full --color=always --highlight-line {2} {1}'"
export FZF_DEFAULT_COMMAND="fd --hidden --follow"
source <(fzf --zsh)

# direnv
eval "$(direnv hook zsh)"

# Volta
export PATH="${HOME}/.volta/bin:${PATH}"

# rbenv
export RBENV_ROOT="$HOME/.local/share/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# Alternative software
alias ls="eza"
alias bat="cat"

# Custom functions
alias update="brew update && brew upgrade && brew cleanup"
alias ..="cd .."
alias ...="cd ../.."

take() {
  mkdir -p "$1"
  cd "$1"
}

source ${HOME}/.config/git/aliases.sh
