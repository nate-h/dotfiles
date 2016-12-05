for f in ~/dotfiles/jobs/*
do
  echo -n "Loading commands for job $f..."
  source $f
  echo "Done!"
done
