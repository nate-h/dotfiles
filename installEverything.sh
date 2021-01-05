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

# download chrome

# generate ssh key

# install git
# git clone git@github.com:nate-h/mypad.git
# git clone git@github.com:nate-h/dotfiles.git

# create dev folder

# sudo apt-get install xclip # Output command to clipboard
# sudo apt install curl
# sudo apt-get install git-gui

# sudo apt-get update
# sudo apt-get install vim


# sudo apt-get update
# sudo apt-get install terminator

##############################################################################
# Blue tooth 
##############################################################################

# https://medium.com/@overcode/fixing-bluetooth-in-ubuntu-pop-os-18-04-d4b8dbf7ddd6

##############################################################################
# Zsh 
##############################################################################

# sudo apt install zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s $(which zsh)

# Install syntax highlighting.
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc


# Install 
# sudo apt-get install python-setuptools
# sudo apt-get install python-pip
# sudo pip install virtualenvwrapper

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

#####################################
# vs code
#####################################

# Install vs code through app store
# Run in working vs code and copy over list:
# code --list-extensions | xargs -L 1 echo code --install-extension


