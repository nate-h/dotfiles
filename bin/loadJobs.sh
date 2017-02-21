for f in ~/dotfiles/jobs/*
do
  if [ -r "$f" ] && [ -f "$f" ]; then
      echo -n "Loading commands for job $(basename $f)..."
      source $f
      echo "Done!"
  else
    echo "Unable to load commands for job: $(basename $f)"
  fi
done
