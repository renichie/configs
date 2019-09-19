#!/bin/bash
#CAREFUL! -- overwrite config files without saving!
declare -a config_files=(
	".bash_aliases"
	".bashrc"
	".tmux.conf"
	".gitconfig"
	".vimrc"
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


#FILE=".bash_aliases"
#if [[ ! -L $FILE ]];
#then
	#rm ~/$FILE;
	#ln -s ~/.configs/$FILE ~/$FILE;
#fi
#
#FILE=".bashrc"
#if [[ ! -L $FILE ]];
#then
	#rm ~/$FILE;
	#ln -s ~/.configs/$FILE ~/$FILE;
#fi
#
#FILE=".tmux.conf"
#if [[ ! -L $FILE ]];
#then
	#rm ~/$FILE;
	#ln -s ~/.configs/$FILE ~/$FILE;
#fi
#
#FILE=".gitconfig"
#if [[ ! -L $FILE ]];
#then
	#rm ~/$FILE;
	#ln -s ~/.configs/$FILE ~/$FILE;
#fi
#
#FILE=".vimrc"
#if [[ ! -L $FILE ]];
#then
	#rm ~/$FILE;
	#ln -s ~/.configs/$FILE ~/$FILE;
#fi
