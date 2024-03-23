#!/bin/zsh

# important note!
echo "This script haven't been tested. Wanna continue? (y/n) " 
read answer
if [ "$answer" != "y" ]; then
  exit 0
fi

# check and install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
