################################################################################
###############################   Nates Bashrc   ###############################
################################################################################


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

################################################################################
###############################   Pimp Console   ###############################
################################################################################


# When tab-completing things, be case-insensitive.
set completion-ignore-case on

# map capslock to backspace
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	setxkbmap -option caps:backspace
fi

gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 13
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.interface text-scaling-factor 1.4

################################################################################
###############################   Exports   ####################################
################################################################################

export PATH=~/.local/bin:$PATH
export PATH=~/.npm-global/bin:$PATH

################################################################################
#########################   Load External Sources   ############################
################################################################################


# Load the shell dotfiles
for file in $HOME/.{git_aliases.sh,shell_exports.sh,shell_aliases.sh,shell_functions.sh,shell_config.sh}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


source ~/dotfiles/bin/loadJobs.sh

# Setup jots
if [ -f ~/dev/jot/jotrc ]  && command -v micro &> /dev/null; then
  source ~/dev/jot/jotrc
else
  echo "Both jot and micro need to be installed."
  echo "Install micro: 'sudo apt install micro'"
  echo "Install jot: 'cd ~/dev && git clone git@github.com:nate-h/jot.git && cd jot && ./run_this_once.sh'"
fi

# Force console to start in home dir. Windows msys terminal doesn't
cd ~
