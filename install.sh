#!/bin/sh
set -x -e

if [ ! -d ".git/hooks" ]; then
    echo "Can't find directory .git/hooks, this script needs to be run in the root of the git repository you want to run it on."
    exit 1
fi

for HOOK in commit-msg
do
    if [ -d ".git/hooks/$HOOK" ]; then
        read -p "Warning! The hook $HOOK already exists, do you want to override it? " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            rm .git/hooks/$HOOK
        fi
    fi
    
    curl https://raw.githubusercontent.com/CCInc/install-githooks/main/hooks/$HOOK --output .git/hooks/$HOOK
    chmod +x .git/hooks/$HOOK
done

echo "Successfully installed hooks"