ZSH_THEME=kolo
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
  # zgen load nojhan/liquidprompt

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
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/vagrant

  # other
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/composer
  zgen oh-my-zsh plugins/yii2

  # themes
  zgen oh-my-zsh themes/kolo

  zgen save
fi

# Source all files under ~/dotfiles/source/
for FILE in $HOME/.dotfiles/source/*; do
	source "$FILE"
done

source $HOME/.nvm/nvm.sh
source $HOME/.rvm/scripts/rvm

fpath=($HOME/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Customize to your needs
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
export ANDROID_NDK_ROOT="$HOME/.applications/android/ndk"
export ANDROID_SDK_ROOT="$HOME/.applications/android/sdk"
export GRADLE_HOME="$HOME/.applications/android/gradle"

export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/.applications/miniconda/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$GRADLE_HOME/bin:$PATH"
export PATH="/opt/lampp/bin:$PATH"
