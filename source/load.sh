# Python
PATH=$HOME/.apps/miniconda/bin:$PATH
source $HOME/.apps/miniconda/bin/activate
source $HOME/.apps/miniconda/bin/aws_zsh_completer.sh

# Ruby
PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH

# FZF
export FZF_CTRL_T_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (coderay {} || cat {}) 2> /dev/null | head -100"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Dotfiles
PATH=$HOME/.dotfiles.local/bin:$HOME/.dotfiles/bin:$PATH
