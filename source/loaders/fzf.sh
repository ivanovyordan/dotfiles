export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (coderay {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh