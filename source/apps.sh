# Package management
alias update="sudo apt-get update; sudo apt-get upgrade"
alias upgrade="sudo apt-get dist-upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias clean="sudo apt-get autoremove; sudo apt-get autoclean"
alias search="apt-cache search"

# Web browsers
alias ff="firefox &"
alias chrome="google-chrome &"
alias browser="x-www-browser &"

# Docker
function docker() {
  if [[ "${1}" == "clean" ]];
  then
    docker rm $(docker ps -a -q)
    docker rmi $(docker images -q)
  else
    /usr/bin/docker "$@"
  fi
}