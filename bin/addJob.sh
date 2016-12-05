#!/bin/bash

# get dir name this script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Lets cd into the folder this script is located
cd "$DIR"

# cd back a dir
cd ..

# create folder if doesn't exist
if [ -d "$1" ]; then
  echo "Job "$1" already exist!"
else
  echo "Attempting to make "$1""
  # add to list of jobs
  cp etc/jobStub.sh jobs/"$1"

fi
