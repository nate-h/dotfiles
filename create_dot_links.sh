# see if the parent directory is located in home directory

echo "Creating symbolic links for dot files"
echo "First testing that all dotfiles don't exist in home diretory"

# check "dotfiles" is located in correct directory
# if [ -d ~/dotfiles ]; then
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
correctDIR=~/dotfiles


if [ "$DIR" == "$correctDIR" ]; then
  echo "directory equal"
else
  echo "directory not equal $DIR $correctDIR"
fi

echo "______________________________
"

echo $DIR
echo ~






dotfiles=(.bashrc .vimrc)

for i in "${dotfiles[@]}"; do
  if [ -f ~/$i ]; then
      echo "Error: Unable to create dotfile for: $i. It already exist."
    else
      ln -s ~/dotfiles/$i ~/$i
  fi
done
