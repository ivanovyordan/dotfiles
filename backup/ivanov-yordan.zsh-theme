PROMPT='%{$fg_bold[green]%}%p%{$fg[cyan]%}%c%{$fg_bold[blue]%}$(git_prompt_info)$(svn_prompt_info)%{$fg_bold[blue]%} % %{$fg_bold[red]%}➜ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_SVN_PROMPT_PREFIX=" svn:(%{$fg[red]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg_bold[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg_bold[blue]%})"