declare -a arr=(~/dotfiles/jobs/appliedinvention.sh ~/dotfiles/jobs/personal.sh)


for job in "${arr[@]}"
do
  echo "Loading commands for: $(basename $job)"
  source $job
done
