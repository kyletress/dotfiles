#!/bin/sh

# set computer name
sudo scutil --set ComputerName "Tress"

# Safari

# Include the develop menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# Set the home page to blank
defaults write com.apple.Safari HomePage -string "about:blank"

# Finder

# Show hidden files and file extensions by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Dock

# Auto hide
defaults write com.apple.dock autohide -bool true
