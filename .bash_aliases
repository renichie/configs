dbash() 	{ docker exec -ti $1 bash; } 	#
#dl()		{docker logs -t $2 $1 }			#does not work as expected
set alias dl='docker logs'
set alias ..='cd ..'
