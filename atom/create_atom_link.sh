#!/bin/bash

################################################################################
########################   Create Dot Symbolic Links   #########################
################################################################################
# dotfiles works by creating symbolic links for each of the dotfiles.
# my reasoning for symbolic links was that I don't want to create a repository
# in my home directory to manage all of my dotfiles. A symbolic link solves this
# problem and lets me manage my dotfiles in a seperate directory.
################################################################################


# We still need this.
windows() { [[ -n "$WINDIR" ]]; }

# Cross-platform symlink function. With one parameter, it will check
# whether the parameter is a symlink. With two parameters, it will create
# a symlink to a file or directory, with syntax: link $linkname $target
link() {
    if [[ -z "$2" ]]; then
        # Link-checking mode.
        if windows; then
            fsutil reparsepoint query "$1" > /dev/null
        else
            [[ -h "$1" ]]
        fi
    else
        # Link-creation mode.
        if windows; then
            # Windows needs to be told if it's a directory or not. Infer that.
            # Also: note that we convert `/` to `\`. In this case it's necessary.
            if [[ -d "$2" ]]; then
                cmd <<< "mklink /D \"$1\" \"${2//\//\\}\"" > /dev/null
            else
                # cmd <<< "echo \"${1//\//\\}\" \"${2//\//\\}\""
                cmd <<< "mklink ${1//\//\\} ${2//\//\\}"  > /dev/null
            fi
        else
            ln -s "$2" "$1"
        fi
    fi
}

# Create symbolic links
dotfiles=(atom)
echo "Attempting to create symbolic links for ${dotfiles[*]}"
for i in "${dotfiles[@]}"; do
  if [ -f ~/$i ]; then
      echo "Error: Unable to create symbolic link for $i. File already exist."
    else
      if windows; then
          link %HOMEPATH%/.$i %HOMEPATH%/dotfiles/$i
      else
          link ~/.$i ~/dotfiles/$i
      fi
      echo "Created symbolic for $i"
  fi
done
