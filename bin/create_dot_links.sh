#!/bin/bash

################################################################################
########################   Create Dot Symbolic Links   #########################
################################################################################
# dotfiles works by creating symbolic links for each of the dotfiles.
# my reasoning for symbolic links was that I don't want to create a repository
# in my home directory to manage all of my dotfiles. A symbolic link solves this
# problem and lets me manage my dotfiles in a seperate directory.
################################################################################



# see if the parent directory is located in home directory
echo -e "Attempting to create symbolic links for dot files\n"


# Create symbolic links
dotfiles=(.bashrc .vimrc)
echo "Attempting to create symbolic links for ${dotfiles[*]}"
for i in "${dotfiles[@]}"; do
  if [ -f ~/$i ]; then
      echo "Error: Unable to create symbolic link for $i. File already exist."
    else
      ln -s ~/dotfiles/$i ~/$i
      echo "Created symbolic"
  fi
done
