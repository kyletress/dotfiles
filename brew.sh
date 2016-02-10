#!/usr/bin/sh

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
brew install hub
brew install imagemagick

# can I install git, rvm, and sass?

# Install cask to get apps
brew install caskroom/cask/brew-cask

# apps
apps=(
  appcleaner
  atom
  github-desktop
  sketch
  google-chrome
  flux
)

# Install these apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# fonts
fonts=(
  font-source-code-pro
  font-source-sans-pro
  font-input
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

brew cleanup
