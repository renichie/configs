################## misc #######################################
alias grep='grep --color=always'

#tmux
alias zsession='~/.tmux_startup.sh'
alias tats='tmux attach-session -t'

#navigating
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ll='ls -lash'
alias hs='history'
alias cls='clear'

################## docker cmds ################################
alias dps='docker ps'
dpsf()		{ docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}\t{{.Image}}'; } #formatted version
dpss()		{ docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}'; } #short formatted version
dbash() 	{ docker cp ~/.bashrc $1:/etc/bash.bashrc; docker exec -ti $1 bash; } 	#copies the user bashrc into the container and opens a shell in it

alias dlogs='docker logs -t --tail 200'
alias dl='docker logs'
alias dins='docker inspect'
alias di='docker inspect'
alias dimgs='docker images'
alias dis='docker images -a'
alias dc='docker-compose'
alias dcst='docker stop'
alias dcrm='docker rm'
