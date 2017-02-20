# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

################################################################################
##############################   Load Settings   ###############################
################################################################################

# laoad settings definitions.
if [ -f ~/dotfiles/settings.sh ]; then
    . ~/dotfiles/settings.sh
fi

################################################################################
###############################   Pimp Console   ###############################
################################################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# this should be the default behavior but its not
set completion-ignore-case on


if [[ "$OSTYPE" == "linux-gnu" ]]; then
	setxkbmap -option caps:backspace
fi

################################################################################
#################   User specific aliases and functions   ######################
################################################################################

alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias path='echo -e ${PATH//:/\\n}'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

alias ll="ls -lv --group-directories-first"
alias ls='ls -hF --color=tty'                 # classify files in colour
alias la='ls -a | grep "^\."'
alias l='ls -CF'                              #

# open with no output
function open(){
	gnome-open "$@" >/dev/null 2>&1

}

################################################################################
############################   Personal Shortcuts   ############################
################################################################################

# alias subl='/c/Program\ Files/Sublime\ Text\ 2/sublime_text.exe'
# alias desk="cd C:/Users/nhapeman.AI/Desktop"


alias createDotLinks="source ~/dotfiles/create_dot_links.sh"
alias g="/opt/google/chrome/google-chrome --enable-plugins"

################################################################################
#######################   Basic Navigation Commands   ##########################
################################################################################


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias desk="cd ~/Desktop"
alias dev="cd ~/dev"
alias down="cd ~/Downloads"


################################################################################
############################   Git Shortscuts   ################################
################################################################################


alias gupdate="git submodule update --init --recursive"
alias fetch="git fetch"
alias pull="git pull"
alias push="git push"
alias rebase="git rebase origin master"
alias stash="git stash"
alias status="git status"
alias gk="gitk --all"
alias gui="git gui"
alias gs="git status"
alias gco="git checkout"
alias gb="git branch"

################################################################################
###############################   Exports   ####################################
################################################################################

# added by Anaconda2 4.0.0 installer
export PATH="/home/nate/anaconda3/bin:$PATH"

# added by Anaconda3 4.1.1 installer
#export PATH="/home/nate/miniconda2/bin:$PATH"

################################################################################
#########################   Load External Sources   ############################
################################################################################

source ~/dotfiles/bin/loadJobs.sh
source ~/mypad/aliases

# Force console to start in home dir. Windows msys terminal doesn't
cd ~