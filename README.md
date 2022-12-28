# Nate's dotfiles

This repo contains tools that help automate the process of getting new machines
to my liking and certain files like my dotfiles that get installed as part
of that automation process. This repo uses symlinks from the dots folder to
the home directory that way we can track dot file changes and sync up with
changes from upstream.

Note: I primarily develop on Ubuntu and MacOS so ymmv

## Installation guide

This should be something to lightly reference.
If installing on a new machine, reevaluate things below.

```sh
    # Setup ssh key and add to github.

    # Setup dotfiles.
    cd ~ && git clone git@github.com:nate-h/dotfiles.git
    ~/dotfiles/bin/create_dot_links.sh

    # Get repos downloaded.
    mkdir ~/dev
    ~/dotfiles/bin/clone_repos.sh
    cd ~/dev/jot && ./run_this_once.sh

    # On mac: get terminal up
    # Get solarized + zsh + git colors setup
    # https://gist.github.com/kevin-smets/8568070
    
```

