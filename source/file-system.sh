# Files will be created with these permissions:
# files 644 -rw-r--r-- (666 minus 022)
# dirs  755 drwxr-xr-x (777 minus 022)
umask 022

## Colorize the ls output ##
alias ls='ls -hF --color=auto'
alias ll='ls -lah --group-directories-first'	# Use a long listing format
alias l.='ls -d .* --color=auto'				# Show hidden files
alias lx='ls -lXBh'								# sort by extension
alias lk='ls -lSrh'								# sort by size, biggest last
alias lc='ls -ltcrh'							# sort by and show change time, most recent last
alias lu='ls -lturh'							# sort by and show access time, most recent last
alias lt='ls -ltrh'								# sort by date, most recent last
alias lm='ls -alh |more'						# pipe through 'more'
alias lr='ls -lRh'								# recursive ls
alias tree='tree -Csu'							# nice alternative to 'recursive ls'

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

# Create a new directory and enter it
function take() {
	mkdir -p "$@" && cd "$@"
}
