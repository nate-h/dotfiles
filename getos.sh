# Use to get os type
# many commands are os specific so this script helps determine which
# scripts to setup

function getos()
{
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
  		echo "linux"
  elif [[ "$OSTYPE" == "msys" ]]; then
  		echo "windows"
  else
    echo "Error: Uknown OS, presuming linux based"
  	os="linux"
  fi
}

var=$(getos)
echo $var
