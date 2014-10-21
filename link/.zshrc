# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="false"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable correction suggestion
DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# shell
plugins=(
	# shell
	dircycle
	command-not-found
	zsh-syntax-highlighting

	# system
	autojump
	lol

	# git
	git
	gitignore
	git-extras
	git-flow

	# node.js
	bower
	npm

	#other
	gem
	atom
	extract
)

source $ZSH/oh-my-zsh.sh

# Source all files in ~/dotfiles/source/
for file in $HOME/.dotfiles/source/*; do
	source "$file"
done

#source $HOME/.liquidprompt/liquidprompt
source $HOME/.nvm/nvm.sh
source $HOME/.rvm/scripts/rvm

# Customize to your needs
export PATH="$HOME/.dotfiles/bin:/opt/lampp/bin:$PATH"
export EDITOR='subl'
