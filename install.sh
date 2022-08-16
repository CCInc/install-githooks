#!/bin/sh

if [ ! -d ".git/hooks" ]; then
    echo "Can't find directory .git/hooks, this script needs to be run in the root of the git repository you want to run it on."
    exit 1
fi

curl http://some.url --output .git/hooks/