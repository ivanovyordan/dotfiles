export FZF_CTRL_T_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (coderay {} || cat {}) 2> /dev/null | head -100"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
