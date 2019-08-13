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

dbash() 	{ docker exec -ti $1 bash; } 	#
