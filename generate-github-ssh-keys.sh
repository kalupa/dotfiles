#!/bin/bash

echo "Setting up GitHub ssh keys"
echo "login to github.com before proceeding ...\n\n"
read -p "Please enter email address:" gh_email
ssh-keygen -t rsa -b 4096 -C "$gh_email"

echo "Copying pub key to macOS clipboard"
pbcopy < ~/.ssh/id_rsa.pub

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
