# https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a


# remove broken symlinks
find -L ~ -maxdepth 1 -type l -delete

# folder where old dot files go
backUpdir="/home/$USER/oldDotFiles"
mkdir -p $backUpdir

# move existing dotfiles to backup dir
dotfiles=(`find ~/dotfiles/dots -name '.*'`)
for i in "${dotfiles[@]}"; do
    if [ -f ~/$(basename $i) ]; then
        echo "$i exists! Moving to backup $backUpdir"
        mv ~/$(basename $i) $backUpdir/$(basename $i)
        # echo ~/$(basename $i)
        # echo $backUpdir/$(basename $i)
    fi
done

# create dot links
source ~/dotfiles/bin/create_dot_links.sh

# reset atom
rm -rf ~/.atom
rm -rf ~/dotfiles/atom/packages
source ~/dotfiles/atom/create_atom_link.sh
source ~/dotfiles/atom/setupAtom.sh


#wnload chrome

#generate ssh key

#install git

#create dev folder

#install atom
#install curl

#sudo apt-get install git-gui

#sudo apt-get update
#sudo apt-get install vim


#sudo apt-get update
#sudo apt-get install terminator

#install zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

#sudo apt-get install python-setuptools

#sudo easy_install pip

#sudo pip install virtualenvwrapper

# Folow this:
# https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a

# install terminator
# install zsh
# install oh my zsh
# install powerline font
# Clean fonts cache
# Move config file
# Solorize everything
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
# Add dotlinks back
# install atom and dependencies
