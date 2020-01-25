# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# open with no output
function open(){
	xdg-open "$@" >/dev/null 2>&1
}

# Enable aliases to be sudo’ed
alias sudo="sudo "


# Shortcuts
alias o="open"
alias oo="open ."
alias e="$EDITOR"
alias g="git"
alias v="vim"
alias gh="github"
alias x+="chmod +x"
alias -- +x="chmod +x"

alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias path='echo -e ${PATH//:/\\n}'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

alias upd='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'

# Local server command
#npm install -g browser-sync
alias serve="browser-sync start -s -f . --no-notify --host localhost --port 9000"

################################################################################
#######################   Basic Navigation Commands   ##########################
################################################################################

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias desk="cd ~/Desktop"
alias dev="cd ~/dev"
alias -- -="cd -"

################################################################################
##################################   Misc   ####################################
################################################################################

# Copy to clipboard
alias clipo="xclip -selection clipboard | xclip -selection clipboard -o"
alias clip="xclip -selection clipboard"

# gunzip
alias ungz="gunzip -k"

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"
alias where=which # sometimes i forget

# Be nice
alias htop='sudo htop'
alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)


# View HTTP traffic
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Download file and save it with filename of remote file
alias get="curl -O -L"


# File size
alias fs="stat -f \"%z bytes\""


# zshrc config
#alias zshrc="${EDITOR} ${$(cd -P $(dirname $0) && cd ..; pwd -P)}"
alias reload="source ~/.zshrc && echo 'Shell config reloaded from ~/.zshrc'"

# zsh.local config
alias localrc="if [[ -a ~/.zsh.local ]]; then ${EDITOR} ~/.zsh.local; fi"


# HTTP Requests. One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

################################################################################
################################   Ls Styling   ################################
################################################################################

alias ll="ls -lv --group-directories-first"
alias la='ls -a | grep "^\."'


# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
alias ls='ls -AFh ${colorflag} --group-directories-first'

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# List only directories
alias lsd='gls -l | grep "^d"'

# `cat` with beautiful colors. requires Pygments installed.
# sudo easy_install -U Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# IP addresses
#alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

#
# GIT STUFF
#

# List git branches on the local machine sorted by recent updates, adding a star to remote tracking branches
function git_list_branches() {
  RED="\e[91m";
  for branch in $(git branch | sed s/^..//); do
    time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
    # Add a red star to mark branches that are tracking something upstream
    tracks_upstream=$(if [ "$(git rev-parse $branch@{upstream} 2>/dev/null)" ]; then printf "$RED★"; fi);
    printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
  done | sort;
}

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



alias gsss="git status -s"
alias gss="git show --stat"
alias gp="git push origin HEAD"
alias gpt="git push origin HEAD && git push --tags"
alias wip="git commit -m'WIP' . && git push origin HEAD"
alias gl='git log'
alias glp5='git log -5 --pretty --oneline' # view your last 5 latest commits each on their own line
alias glt='git log --all --graph --decorate --oneline --simplify-by-decoration' # pretty branch status
alias glsw='git log -S' # search the commit history for the word puppy and display matching commits (glsw [word])
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gam='git commit -am'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gbt=git_list_branches
alias gpu='git pull origin HEAD --prune'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog' # allows you to see every step you have made with git allowing you to retract and reinstate your steps
alias gap='git add -p' # step through each change, or hunk
alias gsl='git shortlog -sn' # quickly get a list of contributors and see how many commits each person has
alias gws='git diff --shortstat "@{0 day ago}"' # how many lines of code you have written today
alias gwts='git ls-files | xargs wc -l' # count number of lines of code in a git project
alias ggmp='git checkout -' # jump back to to your last branch
alias gst='git stash' # stash git changes and put them into your list
alias gdtp='git stash pop' # bring back your changes, but it removes them from your stash
alias gchp='git cherry-pick' # cherry pick the committed code in your own branch (gchp [hash])
alias gcln='git clean -xfd' # remove untracked files

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# `cd` to Git repo root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# Attempt to connect to bluetooth headphones
alias sony='sudo systemctl restart bluetooth && sleep 5 && echo -e "connect 04:5D:4B:83:4B:D4 \nquit" | bluetoothctl'
