export FZF_CTRL_T_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (coderay {} || cat {}) 2> /dev/null | head -100"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
