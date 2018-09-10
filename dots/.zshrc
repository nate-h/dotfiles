# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/nate/.oh-my-zsh


# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Load personal alias', commands, etc..
source ~/.bashrc

# Configure zsh
ZSH_THEME="agnoster"
plugins=(virtualenv virtualenvwrapper zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
source /home/nate/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval `dircolors ~/.dir_colors/dircolors`

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
