#!/bin/bash

#TODO make it generic via list of file/folder names

#remove existing files if they exist
rm -f ~/.bashrc
rm -f ~/.vimrc
rm -rf ~/.i3

#create symbolic links
ln -s ~/configs/.bashrc ~/.bashrc
ln -s ~/configs/.vimrc ~/.vimrc
ln -s ~/configs/.i3 ~/.i3

