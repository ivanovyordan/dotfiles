source "$HOME/.dotfiles/antigen/antigen.zsh"

antigen use oh-my-zsh

# shell
antigen bundle dircycle
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen bundle nojhan/liquidprompt

# system
antigen bundle autojump
antigen bundle lol
antigen bundle common-aliases

# git
antigen bundle git
antigen bundle gitignore
antigen bundle git-extras
antigen bundle git-flow

# node.js
antigen bundle bower
antigen bundle npm

#other
antigen bundle atom
antigen bundle extract
antigen bundle yii2

antigen apply

# Source all files in ~/dotfiles/source/
for FILE in $HOME/.dotfiles/source/*; do
	source "$FILE"
done

source $HOME/.nvm/nvm.sh
source $HOME/.rvm/scripts/rvm

# Customize to your needs
export PATH="$HOME/.dotfiles/bin:$PATH"
