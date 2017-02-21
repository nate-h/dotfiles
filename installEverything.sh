# https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a


# remove broken symlinks
find -L ~ -maxdepth 1 -type l -delete

# move existing dotfiles to backup dir
dotfiles=(`find ~/dotfiles/dots -name '.*'`)
for i in "${dotfiles[@]}"; do
    if [ -f ~/$(basename $i) ]; then
        backUpdir="~/oldDotFiles"
        echo "$i exists! Moving to backup $backUpdir"
        mkdir -p $backUpdir
        #mv ~/$(basename $i) $backUpdir/$(basename $i)
    fi
done

return 1

# reset atom
rm -rf ~/.atom
rm -rf ~/dotfiles/atom/packages
source ~/dotfiles/bin/create_dot_links.sh
source ~/dotfiles/atom/create_atom_link.sh
source ~/dotfiles/atom/setupAtom.sh

# install terminator
# install zsh
# install oh my zsh
# install powerline font
# Clean fonts cache
# Move config file
# Solorize everything

# Add dotlinks back
# install atom and dependencies
