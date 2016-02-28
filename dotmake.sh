#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old            
files="bashrc bash_profile Brewfile vimrc vim"   
sshconfig=~/dotfiles/ssh_config

# create dotfiles_old in homedir
mkdir -p $olddir
cd $dir

#backup dotfiles and create symlinks 
for file in $files; do
   mv ~/.$file ~/dotfiles_old/
   ln -s $dir/$file ~/.$file
done

#link just ssh config
ln -s $sshconfig ~/.ssh/config
