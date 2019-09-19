################## misc #######################################
alias grep='grep --color=always'
alias hgrep='history | grep'
alias reload='source ~/.bashrc'

#tmux
alias zsession='~/.tmux_startup.sh'
alias tats='tmux attach-session -t'
alias zaxs='tmux attach-session -t zax'
alias tshared='tmux -S /var/tmux/socket attach'
iuvo()	{ tmux -S /var/tmux/iuvo attach; }

#navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -lash'

#terminal view
alias hs='history'
alias cls='clear'

################## docker ################################
#dpsf()		{ docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}\t{{.Ports}}'; } #formatted version
dpsf()		{ docker ps $@ --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}\t{{.Ports}}'; } #formatted version
dpss()		{ docker ps $@ --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}'; } #short formatted version
dbash() 	{ docker cp ~/.bashrc $1:/etc/bash.bashrc; docker exec -ti $1 bash; } 	#copies the user bashrc into the container and opens a shell in it
dkrm()		{ docker stop $1; docker rm $1; }
dimn()		{ docker images $@ --format 'table {{.Repository}}\t{{.Tag}}\t{{.ID}}'; }
#TODO irgend ein syntax fehler
#dhf()		{ docker history --format 'table {{.ID}}\t{{.CreatedAt}}\t{{.CreatedBy}}' $@; }

alias dps='docker ps'
alias dlogs='docker logs -t --tail 200'
alias dl='docker logs -t -f'
alias dins='docker inspect'
alias di='docker inspect'
alias dimgs='docker images'
alias dis='docker images -a'
alias dc='docker-compose'
alias dcst='docker stop'
alias dcrm='docker rm'
alias dst='docker stats'
alias dogger='docker'
alias drmi='docker image rm'
alias dstop='docker stop'
alias phs='history | grep'
