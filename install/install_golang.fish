#!/usr/bin/env fish


function install_golang
  if test $argv[1] = "Darwin"
    set platform "darwin-amd64"
  else
    set platform "linux-amd64"
  end

  set go_version (curl -sq https://golang.org/dl/ | grep toggleVisible | head -1 | awk -F '"' '{print $4}' | xargs)
  set package $go_version.$platform.tar.gz
  set GODIR $HOME/.apps/go
  set -Ux GOROOT $GODIR/root
  set -Ux GOPATH $GODIR/path

  set -Ua fish_user_paths $GOROOT/bin
  set -Ua fish_user_paths $GOPATH/bin

  mkdir -p $GOROOT
  mkdir -p $GOPATH


  curl -o $package https://dl.google.com/go/$package
  tar -C "$GOROOT" --strip-components=1 -xzf $package
  rm $package
end

function install_packages
  go get -u golang.org/x/tools/...
  go get -u golang.org/x/lint/golint

  env GO111MODULE=on go get -u github.com/gopasspw/gopass
  mkdir -p ~/.config/fish/completions
  gopass completion fish > ~/.config/fish/completions/gopass.fish
end

function main
  install_golang $argv[1]
  install_packages
end

main $argv[1..-1]
