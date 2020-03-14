################## misc #######################################
alias grep='grep --color=always'
alias hgrep='history | grep'
alias hg='history | grep'
alias reload='source ~/.bashrc'

#tmux
alias zsession='~/scripts/tmux_start_zax_session.sh'
alias tats='tmux attach-session -t'
alias ta='tats'
alias tzax='tmux attach-session -t zax'
alias taudi='tmux attach-session -t audi'
alias tshared='tmux -S /var/tmux/socket attach'
tiuvo()	{ tmux -S /var/tmux/iuvo attach; }

####################################### SSH ##############################################
alias iuvo215='ssh -i ~/.ssh/tvtyxyq\@iuvo215.p_key tvtyxyq@iuvo215.in.audi.vwg'
iuvo215scpr() { scp -i ~/.ssh/tvtyxyq\@iuvo215.p_key tvtyxyq@iuvo215.in.audi.vwg:$1 $2;}
iuvo215scp() { scp -i ~/.ssh/tvtyxyq\@iuvo215.p_key $1 tvtyxyq@iuvo215.in.audi.vwg:$2; }
#iuvo215scp() {
#		scp -i ~/.ssh/tvtyxyq\@iuvo215.p_key tvtyxyq@iuvo215.in.audi.vwg:$1 $2;
#}
#alias iuvo215_old='ssh -p 10022 -i ~/.ssh/tvtyxyq\@iuvo215.p_key tvtyxyq@localhost'

ota() {
	f5fpc --start --host https://rmgw.audi.de -x -u ${1:-tvtyxyq} -p ${2} < /dev/null >& /dev/null &
}

otad() {
	ota tvtyxyq ${1}
}


#open ssh tunnel to iuvo215
open_tunnel_jenkins_audi() 	{ 
	JENKINS=${1:-donat_jenkins}
	TPORT=${2:-10022}
	USR=${3:-tvtyxyq}
	echo
	docker exec -t ${1:-donat_jenkins} ssh -L ${2:-10022}:iuvo215.in.audi.vwg:22 ${3:-tvtyxyq}@appgate.audi.de
}

open_tunnel_audi() { ssh -L 10022:iuvo215.in.audi.vwg:22 tvtyxyq@appgate.audi.de; }
#open ssh tunnel to iuvo215

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
unalias dps
dps()		{ docker ps $@ --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}'; } #formatted version #2
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

alias newworld='cd /data/jenkins_data/workspace/NewWorld_Build_and_Deploy'
alias nw='newworld'
