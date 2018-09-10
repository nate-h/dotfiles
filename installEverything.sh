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
#rm -rf ~/.atom
#rm -rf ~/dotfiles/atom/packages
#source ~/dotfiles/atom/create_atom_link.sh
#source ~/dotfiles/atom/setupAtom.sh


#download chrome

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

#######################
#install zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s $(which zsh)

# Install syntax highlighting.
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
 #echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc




#sudo apt-get install python-setuptools

#sudo easy_install pip

#sudo pip install virtualenvwrapper

# Folow this:
# https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a
# Modified follow this:
# sudo apt-get install dconf-cli
#git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
#cd ~/.solarized
#./install.sh
# Do this next:
#I recommend you option 1 (dark theme) which is just great.
#Choose option 1 to download seebi' dircolors-solarized