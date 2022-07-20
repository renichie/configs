#!/bin/bash
declare -a config_files=(
	".bash_aliases"
	".bashrc"
	".tmux.conf"
	".gitconfig"
	".vimrc"
	".profile"
)

mkdir -p ./config_backup

for FILE in "${config_files[@]}"
do
	if [[ -f ~/$FILE ]] 
	then
		if [[ ! -L ~/$FILE ]];
		then
			echo "backing up $FILE first..."
			cp -f ~/$FILE ./config_backup
		fi
		rm -f ~/$FILE;
		echo "creating link to $FILE"
		ln -s ~/.configs/$FILE ~/$FILE;
	fi
done
