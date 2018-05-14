#!/bin/bash

github_user="$(git config --get github.user)"

if [[ ${#github_user} > 0 ]]; then
    echo $github_user
else
    echo $(whoami)
fi
