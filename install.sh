#!/bin/sh

echo "Installing dotfiles..."

# Homebrew 

if test ! $(which brew); then 
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
  echo "Homebrew already installed. Moving on..."
fi

brew update
brew tap homebrew/bundle
brew bundle

echo "Done."
