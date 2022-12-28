# Inspired by many answers here:
# https://stackoverflow.com/questions/19576742/how-to-clone-all-repos-at-once-from-github

mkdir -p ~/dev
cd ~/dev

# Grab github username
read -p "Enter your github username [nate-h]: " GHUSER
GHUSER=${name:-nate-h}

# If token specified, download private repos as well.
echo "Create token at: https://github.com/settings/tokens"
read -p "Enter access token to download private repos as well?: " TOKEN

# Download
if [ -n "$TOKEN" ]; then
    # Private + public - forks.
    curl -u $GHUSER:$TOKEN https://api.github.com/user/repos\?page\=1\&per_page\=100 |
        jq -r 'map(select(.fork == false)) | .[] | .ssh_url' | xargs -L1 git clone
else
    # Public.
    curl -s "https://api.github.com/users/$GHUSER/repos?per_page=1000" |
        grep -o 'git@[^"]*' | xargs -L1 git clone
fi
