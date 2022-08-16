#!/bin/sh
set -x -e

if [ ! -d ".git/hooks" ]; then
    echo "Can't find directory .git/hooks, this script needs to be run in the root of the git repository you want to run it on."
    exit 1
fi

curl https://raw.githubusercontent.com/CCInc/install-githooks/main/hooks/commit-msg --output .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg

echo "Successfully installed hooks"