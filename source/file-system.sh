# Files will be created with these permissions:
# files 644 -rw-r--r-- (666 minus 022)
# dirs  755 drwxr-xr-x (777 minus 022)
umask 022

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"
alias du='du -ch'

## Create parent directories on demand ##
alias mkdir='mkdir -pv'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

## Make mount command output pretty and human readable format ##
alias mount='mount |column -t'

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Create a new directory and enter it
function take() {
	mkdir -p "$@" && cd "$@"
}
