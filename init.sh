#!/bin/bash

echo "----- Running dotfiles/init.sh"

# Require starship
if [[ ! $(which starship) ]]; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Configure macOS preferences
[[ $(uname) = Darwin ]] && source ./mac/setup.sh

echo "----- Completed dotfiles/init.sh"
