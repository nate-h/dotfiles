#!/bin/bash
# Create Symbolic Links for all dot files in the dots folder.

# Simple check if using windows.
windows() { [[ -n "$WINDIR" ]]; }

# Cross-platform symlink function. With one parameter, it will check
# whether the parameter is a symlink. With two parameters, it will create
# a symlink to a file or directory, with syntax: link $linkname $target
link() {
    if [[ -z "$2" ]]; then
        # Link-checking mode.
        if windows; then
            fsutil reparsepoint query "$1" >/dev/null
        else
            [[ -L "$1" ]]
        fi
    else
        # Link-creation mode.
        if windows; then
            # Windows needs to be told if it's a directory or not. Infer that.
            # Also: note that we convert `/` to `\`. In this case it's necessary.
            if [[ -d "$2" ]]; then
                cmd <<<"mklink /D \"$1\" \"${2//\//\\}\"" >/dev/null
            else
                cmd <<<"mklink ${1//\//\\} ${2//\//\\}" >/dev/null
            fi
        else
            ln -s "$2" "$1"
        fi
    fi
}

# Create symbolic links
dotfiles=($(find ~/dotfiles/dots -name '.*'))
for i in "${dotfiles[@]}"; do
    if [ -f ~/$i ]; then
        echo "Error: Unable to create symbolic link for $i. File already exist."
    else
        if windows; then
            link %HOMEPATH%/$i %HOMEPATH%/dotfiles/$i
        else
            if [[ -f ~/$(basename $i) ]]
            then
                echo "Cannot create symlink for $(basename $i). Already exists."
            else
                link ~/$(basename $i) $i
                echo "Created symbolic for $i"
            fi
        fi
    fi
done
