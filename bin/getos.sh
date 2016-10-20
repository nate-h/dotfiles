os="windows"
job="job2" # possible optioins: job1, job2, personal



if [[ "$OSTYPE" == "linux-gnu" ]]; then
	echo "linux"
		os="linux"
elif [[ "$OSTYPE" == "msys" ]]; then
  echo "Detected windows as OS"
		os="windows"
else
  echo "Error: Uknown OS, presuming linux based"
	os="linux"
fi
