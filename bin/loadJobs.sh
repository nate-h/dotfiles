declare -a arr=(~/dotfiles/jobs/appliedinvention)


for job in "${arr[@]}"
do
  echo "Loading commands for: $(basename $job)"
  source $job
done
