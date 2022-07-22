################## misc #######################################
alias grep='grep --color=always'
alias hgrep='history | grep'
alias hg='history | grep'
alias reload='source ~/.bashrc'

#tmux
alias tats='tmux attach-session -t'
alias ta='tats'
alias tshared='tmux -S /var/tmux/socket attach'

####################################### SSH ##############################################

#navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -lash'

#terminal view
alias hs='history'
alias cls='clear'

#password generation
generate_password()	{ date +%s | sha256sum | base64 | head -c 32 ; echo; }

################## docker ################################
#dpsf()		{ docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}\t{{.Ports}}'; } #formatted version
# somehow this is needed on 'zax'; must be set somewhere i don't know <-- /etc/bashrc ?
#unalias dps
#dps()		{ docker ps $@ --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}'; } #formatted version #2
dpss()		{ docker ps $@ --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}'; } #short formatted version
dpsp()		{ docker ps $@ --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'; } #short formatted version
dpsl()		{ docker ps $@ --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}\t{{.Ports}}'; } #formatted version #1
dbash() 	{ docker cp ~/.bashrc $1:/etc/bash.bashrc; docker exec -ti $1 bash; } 	#copies the user bashrc into the container and opens a shell in it
dpsql()		{ docker exec -it ${1:-zax-donat_dev-db} psql -U postgres; }
dbr()		{ docker exec -ti -u root $1 bash; }
dkrm()		{ docker stop $1; docker rm $1; }
dimn()		{ docker images $@ --format 'table {{.Repository}}\t{{.Tag}}\t{{.ID}}'; }
dcrm()		{ docker stop $1 ; docker rm $1; }
dcDelWar()	{ docker exec -t -u root $1 rm -rf /opt/ol/wlp/usr/servers/defaultServer/dropins/expanded; docker restart $1; }
#TODO irgend ein syntax fehler
#dhf()		{ docker history --format 'table {{.ID}}\t{{.CreatedAt}}\t{{.CreatedBy}}' $@; }
dpsql()		{ docker exec -ti $1 psql -U postgres;}

alias dbzam='docker exec -ti zax psql -U postgres'
alias dlogs='docker logs -t --tail 200'
alias dl='docker logs -t -f'
alias dins='docker inspect'
alias di='docker inspect'
alias dimgs='docker images'
alias dis='docker images -a'
alias dc='docker-compose'
alias dcst='docker stop'
alias dst='docker stats'
alias dogger='docker'
alias drmi='docker image rm'
alias dstop='docker stop'


################################## misc #####################################
