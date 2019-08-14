alias dl='docker logs -t --tail 200'
alias ..='cd ..'
alias ...='cd ../..'
alias dps='docker ps'
alias dins='docker inspect'
alias dimgs='docker images'
alias dc='docker-compose'
alias dcst='docker stop'
alias dcrm='docker rm'
alias hs='history'
alias cls='clear'

################## misc #######################################
alias grep='grep --color=always'


################## docker cmds ################################
dpsf()		{ docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}\t{{.Image}}'; } #formatted version
dpss()		{ docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}'; } #short formatted version
#dbash() 	{ docker exec -ti $1 bash; } 	#
dbash() 	{ docker cp ~/.bashrc $1:/etc/bash.bashrc; docker exec -ti $1 bash; } 	#

