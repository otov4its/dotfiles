#!/bin/bash

########## Variables
dir=~/.dotfiles # dotfiles directory
olddir=~/.dotfiles_original # old dotfiles backup directory
files=".vimrc" # list of files/folders to symlink in homedir
##########
 
# create $olddir in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
 
# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
 
# move any existing dotfiles in homedir to $olddir directory, then create symlinks
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/$file $olddir
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
done