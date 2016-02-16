#!/bin/sh

# check for homebrew
echo "Installing homebrew..."
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Already installed."
fi

echo 'Brew bundle...'
brew bundle

exit 0
