################################################################################
###############################   Nates Bashrc   ###############################
################################################################################


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

################################################################################
##############################   Load Settings   ###############################
################################################################################

# load settings definitions.
if [ -f ~/dotfiles/settings.sh ]; then
    . ~/dotfiles/settings.sh
fi

################################################################################
###############################   Pimp Console   ###############################
################################################################################


# this should be the default behavior but its not
set completion-ignore-case on

# map capslock to backspace
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	setxkbmap -option caps:backspace
fi

gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 13
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.interface text-scaling-factor 1.25

################################################################################
###############################   Exports   ####################################
################################################################################

# added by Anaconda2 4.0.0 installer
#export PATH="/home/nate/anaconda3/bin:$PATH"

# added by Miniconda3 4.3.11 installer
#export PATH="/home/nate/miniconda3/bin:$PATH"
export PATH=~/.local/bin:$PATH
#export LOCAL_IP=`ipconfig getifaddr en0`

export PATH=~/.npm-global/bin:$PATH



################################################################################
#########################   Load External Sources   ############################
################################################################################


# Load the shell dotfiles
for file in $HOME/.{shell_exports.sh,shell_aliases.sh,shell_functions.sh,shell_config.sh}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



source ~/dotfiles/bin/loadJobs.sh
source ~/mypad/aliases

# Force console to start in home dir. Windows msys terminal doesn't
cd ~
