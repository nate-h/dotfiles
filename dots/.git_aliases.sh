################################################################################
############################   Git Shortscuts   ################################
################################################################################

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


# Common good aliases.
alias gupdate="git submodule update --init --recursive"
alias gsss="git status -s"
alias gss="git show --stat"
alias gp="git push origin HEAD"
alias fetch="git fetch"
alias pull="git pull"
alias push="git push"
alias stash="git stash"
alias status="git status"
alias gk="gitk --all"
alias gui="git gui"
alias gs="git status"
alias gco="git checkout"
alias gb="git branch"
alias gcm="git commit -m"
alias gl='git log'

# Aliases I don't use but probably should.
alias rebase="git rebase origin master"
alias gpt="git push origin HEAD && git push --tags"
alias wip="git commit -m'WIP' . && git push origin HEAD"
alias glp5='git log -5 --pretty --oneline' # view your last 5 latest commits each on their own line
alias glt='git log --all --graph --decorate --oneline --simplify-by-decoration' # pretty branch status
alias glsw='git log -S' # search the commit history for the word puppy and display matching commits (glsw [word])
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