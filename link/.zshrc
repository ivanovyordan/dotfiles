# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ivanov-yordan"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="false"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump cpanm debian dircycle git git-flow github lol svn)

source $ZSH/oh-my-zsh.sh

# Source all files in ~/dotfiles/source/
for file in $HOME/.dotfiles/source/*; do
	source "$file"
done

# Source Z.sh
. $HOME/.dotfiles/z.sh/z.sh
function precmd () {
	z --add "$(pwd -P)"
}

# Customize to your needs...
export PATH="$HOME/.dotfiles/bin:$PATH"
export EDITOR='subl'