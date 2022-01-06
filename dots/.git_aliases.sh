#########
# Aliases
#########

# Aliases I have down.
alias g="git"
alias gb="git branch"
alias gui="git gui" # View current changes in a gui
alias gk="gitk --all" # View all git commits in a gui
alias gf="git fetch --prune"
alias gs="git status -s"  # short status
alias gl="git log"
alias gd="git diff"
alias gss="git show --stat"
alias gph="git push origin HEAD"
alias gco="git checkout"
alias gcm="git commit -m"
alias gap="git add -p" # step through each change, or hunk
alias undopush="git push -f origin HEAD^:master"  # Undo a `git push`
alias gupdate="git submodule update --init --recursive"

# Aliases I need to get down.
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'  # `cd` to Git repo root
alias gws='git diff --shortstat "@{0 day ago}"' # how many lines of code you have written today
alias gsl="git shortlog -sn" # quickly get a list of contributors and see how many commits each person has
alias gwcl="git ls-files | xargs wc -l" # count number of lines of code in a git project
alias gam="git commit -am"  # Git commit all w/ message

# Aliases for another day.
alias rebase="git rebase origin master"
alias gpt="git push origin HEAD && git push --tags"
alias glp5="git log -5 --pretty --oneline" # view your last 5 latest commits each on their own line
alias glt="git log --all --graph --decorate --oneline --simplify-by-decoration" # pretty branch status
alias glsw="git log -S" # search the commit history for the word puppy and display matching commits (glsw [word])
alias gta="git tag -a -m"
alias grl="git reflog" # allows you to see every step you have made with git allowing you to retract and reinstate your steps
alias gchp="git cherry-pick" # cherry pick the committed code in your own branch (gchp [hash])
alias gcln="git clean -xfd" # remove untracked files


###########
# Functions
###########

# List git branches on the local machine sorted by recent updates, adding a star to remote tracking branches
function gbl() {
  RED="\e[91m";
  for branch in $(git branch | sed s/^..//); do
    time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
    # Add a red star to mark branches that are tracking something upstream
    tracks_upstream=$(if [ "$(git rev-parse $branch@{upstream} 2>/dev/null)" ]; then printf "$RED★"; fi);
    printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
  done | sort;
}

# List remote branches that aren't head or master.
function ab() {
  format='%(committerdate:short) %09 %(authorname) %09 %(refname)'
  git for-each-ref --sort=authorname committerdate --format=$format refs/remotes \
  | awk '!/HEAD/ && !/master/'
}

# List current work on your branch. (commits from head to master.)
function gcw() {
  git log --pretty=format"- %s" master..HEAD
}
