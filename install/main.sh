#!/usr/bin/env bash

declare -r GITHUB_REPOSITORY=ivanovyordan/dotfiles
declare -r DOTFILES_ORIGIN=git@github.com:$GITHUB_REPOSITORY.git
declare -r DOTFILES_TARBALL=https://github.com/$GITHUB_REPOSITORY/tarball/fish
declare -r DOTFILES_DIRECTORY=$HOME/.dotfiles
declare -r LOCAL_DOTFILES_DIRECTORY=$HOME/.dotfiles.local

function request_sudo() {
  sudo -v &> /dev/null

  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done 2>/dev/null &
}

function download() {
  local source=$1
  local target=$2

  if command -v curl &> /dev/null; then
    curl -LsSo $target $source &> /dev/null
  else
    wget -qO $target $source &> /dev/null
  fi
}

function download_dotfiles() {
  tmp_dotfiles=$(mktemp /tmp/XXXXXXXX)
  download $DOTFILES_TARBALL $tmp_dotfiles

  if [ -e $DOTFILES_DIRECTORY ]; then
    mv $DOTFILES_DIRECTORY $DOTFILES_DIRECTORY.back
  fi

  mkdir -p $DOTFILES_DIRECTORY
  tar -zxf $tmp_dotfiles --strip-components 1 -C $DOTFILES_DIRECTORY
  rm -f $tmp_dotfiles

  cd $DOTFILES_DIRECTORY/install
}

function create_local_dotfiles() {
  mkdir -p $LOCAL_DOTFILES_DIRECTORY
  touch  $LOCAL_DOTFILES_DIRECTORY/init.fish
  touch  $LOCAL_DOTFILES_DIRECTORY/init.vim
}

function link_dotfiles() {
  ln -s $DOTFILES_DIRECTORY/config/git/gitconfig $HOME/.gitconfig
  ln -s $DOTFILES_DIRECTORY/config/npmrc $HOME/.npmrc
  ln -s $DOTFILES_DIRECTORY/config/pryrc $HOME/.pryrc
  ln -s $DOTFILES_DIRECTORY/config/tmux/tmux.conf $HOME/.tmux.conf

  mkdir -p $HOME/.config/nvim
  ln -s $DOTFILES_DIRECTORY/config/nvim/init.vim ${HOME}/.config/nvim
  ln -s $DOTFILES_DIRECTORY/config/nvim/coc-settings.json $HOME/.config/nvim
  ln -s $DOTFILES_DIRECTORY/config/nvim/UltiSnips $HOME/.config/nvim
  ln -s $DOTFILES_DIRECTORY/config/nvim/after $HOME/.config/nvim
  ln -s $DOTFILES_DIRECTORY/config/nvim/syntax $HOME/.config/nvim

  ln -s $DOTFILES_DIRECTORY/config/mutt/muttrc $HOME/.muttrc
  ln -s $DOTFILES_DIRECTORY/config/mutt/mbsyncrc $HOME/.mbsyncrc
  ln -s $DOTFILES_DIRECTORY/config/mutt/msmtprc $HOME/.msmtprc
}

function install_packages() {
  local kernel_name="$(uname -s | tr -d '\n')"

  if [ $kernel_name == "Darwin" ]; then
    bash install_mac_packages.sh
  elif [ $kernel_name == "Linux" ]; then
    bash install_linux_packages.sh
  fi

  bash ./install_fish.sh $kernel_name
  fish ./install_docker.fish $kernel_name
  fish ./install_golang.fish $kernel_name
  fish ./install_python.fish $kernel_name
  fish ./install_ruby.fish $kernel_name
  fish ./install_node.fish $kernel_name
  fish ./install_fzf.fish $kernel_name
  fish ./install_mail.fish $kernel_name
  fish ./install_vim.fish $kernel_name
  fish ./complete_installation.fish $kernel_name
}

function main() {
  request_sudo
  download_dotfiles
  create_local_dotfiles
  link_dotfiles
  install_packages
}

main
