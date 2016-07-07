os="windows"
job="job1" # possible optioins: job1, job2, personal



if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# Mac OSX
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
  # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # ...
else
  # Unknown.
fi
