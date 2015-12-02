source "$HOME/.dotfiles/zgen/zgen.zsh"

# Check if there's no init script
if ! zgen saved
then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # Plugins
  # shell
  zgen oh-my-zsh plugins/dircycle
  zgen oh-my-zsh plugins/command-not-found
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen load nojhan/liquidprompt

  # system
  zgen oh-my-zsh plugins/autojump
  zgen oh-my-zsh plugins/lol
  zgen oh-my-zsh plugins/common-aliases

  # git
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/gitignore
  zgen oh-my-zsh plugins/git-extras
  zgen oh-my-zsh plugins/git-flow

  # node.js
  zgen oh-my-zsh plugins/bower
  zgen oh-my-zsh plugins/npm

  # devops
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/vagrant

  #other
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/composer
  zgen oh-my-zsh plugins/yii2

  zgen save
fi

# Source all files under ~/dotfiles/source/
for FILE in $HOME/.dotfiles/source/*; do
	source "$FILE"
done

source $HOME/.nvm/nvm.sh

# Customize to your needs
export PATH="$HOME/.dotfiles/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/bin/java"