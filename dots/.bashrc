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
gsettings set org.gnome.desktop.interface text-scaling-factor 1.25

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
source ~/dev/jot/jotrc

# Force console to start in home dir. Windows msys terminal doesn't
cd ~
