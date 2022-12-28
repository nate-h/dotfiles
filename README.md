# Nate's dotfiles

This repo is designed to make the process of getting dot files easier on new machines.
Additionally, it helps keep track of any changes to those files so future machines
or other existing machines can have the same setup. All of the magic is in using
symlnks to link files in this directory to the home directory. There are other goodies
in this repo that aren't related to dotfiles that are generally useful for my setup.

Note: I primarily develop on Ubuntu and MacOS so ymmv

## Installation guide

This should be something to lightly reference.
If installing on a new machine, reevaluate things below.

```sh
    # Setup ssh key and add to github.

    # Setup dotfiles.
    cd ~ && git clone git@github.com:nate-h/dotfiles.git
    ~/dotfiles/bin/create_dot_links.sh

    # On mac: get terminal up
    # Get solarized + zsh + git colors setup
    # https://gist.github.com/kevin-smets/8568070

    brew install micro
    brew install git-gui
    # install python3 via website
    pip3 install pygments
    pip3 install jq

    # Get repos downloaded.
    brew install jq
    ~/dotfiles/bin/clone_repos.sh

    # Get my personal note taking app working.
    cd ~/dev/jot && ./run_this_once.sh
```

