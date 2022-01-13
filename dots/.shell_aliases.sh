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
alias c="clear"
alias h="history"
alias o="open"
alias oo="open ."
alias e="$EDITOR"
alias g="git"
alias v="vim"
alias x+="chmod +x"
alias -- +x="chmod +x"

alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in color
alias egrep='egrep --color=auto'              # show differences in color
alias fgrep='fgrep --color=auto'              # show differences in color

alias path='echo -e ${PATH//:/\\n}'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

alias upd='sudo apt-get update && sudo apt-get upgrade'

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
alias n3="cd ~/dev/nhapeman_v3"
alias whirl="cd ~/dev/Whirling"
cdl() { cd "$1" && ls; }

################################################################################
##################################   Misc   ####################################
################################################################################

# Remove pycache
alias nopyc="find . | grep -E \"(__pycache__|\.pyc|\.pyo$)\" | xargs rm -rf"

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

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Attempt to connect to bluetooth headphones
alias sony='sudo systemctl restart bluetooth && sleep 5 && echo -e "connect 04:5D:4B:83:4B:D4 \nquit" | bluetoothctl'
alias rr='ranger'
