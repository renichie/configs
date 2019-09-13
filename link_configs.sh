#!/bin/bash
#CAREFUL! -- overwrite config files without saving!
FILE=".bash_aliases"
if [[ ! -L $FILE ]];
then
	rm ~/$FILE;
	ln -s ~/.configs/$FILE ~/$FILE;
fi

FILE=".bashrc"
if [[ ! -L $FILE ]];
then
	rm ~/$FILE;
	ln -s ~/.configs/$FILE ~/$FILE;
fi

FILE=".tmux.conf"
if [[ ! -L $FILE ]];
then
	rm ~/$FILE;
	ln -s ~/.configs/$FILE ~/$FILE;
fi

FILE=".gitconfig"
if [[ ! -L $FILE ]];
then
	rm ~/$FILE;
	ln -s ~/.configs/$FILE ~/$FILE;
fi

FILE=".vimrc"
if [[ ! -L $FILE ]];
then
	rm ~/$FILE;
	ln -s ~/.configs/$FILE ~/$FILE;
fi
