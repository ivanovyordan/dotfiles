export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (coderay {} || cat {}) 2> /dev/null | head -100"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
