#!/usr/bin/env bash

# This installs homebrew, utilities, apps, and fonts.

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
brew update
brew upgrade --all

# Install some stuff
brew install coreutils
brew install git
brew install postgresql
brew install redis
brew install heroku-toolbelt

# can I install git, rvm, and sass?

# Install cask to get apps
brew install caskroom/cask/brew-cask

# apps
apps=(
  appcleaner
  atom
  github-desktop
  minecraft
  transmission
)

# Install these apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# fonts
fonts=(
  font-source-sans-pro
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

brew cleanup
