# Colorize grep output
alias grep='grep --color=auto'

# Colorize diff
alias diff='colordiff'

# Get public IP address
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Show open ports
alias ports='netstat -tulanp'

# Resume wget by default
alias wget='wget -c'

# Start calculator with math support
alias bc='bc -l'

alias mux='tmuxinator'
alias screencast='ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f pulse -ac 2 -i default -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -vsync 2 -acodec libmp3lame -ar 44100 -ab 128k -f flv'
