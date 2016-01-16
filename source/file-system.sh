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

# Go up [n] directories
function up() {
	local cdir="$(pwd)"
	if [[ "${1}" == "" ]]; then
		cdir="$(dirname "${cdir}")"
	elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
		echo "Error: argument must be a number"
	elif ! [[ "${1}" -gt "0" ]]; then
		echo "Error: argument must be positive"
	else
		for i in {1..${1}}; do
			local ncdir="$(dirname "${cdir}")"
			if [[ "${cdir}" == "${ncdir}" ]]; then
				break
			else
				cdir="${ncdir}"
			fi
		done
	fi
	cd "${cdir}"
}

# Because typing 'cd' is A LOT of work!!
alias ..='up 1'
alias ...='up 2'
alias ....='cup 3'
alias .....='up 4'

# Create a new directory and enter it
function take() {
	mkdir -p "$@" && cd "$@"
}
