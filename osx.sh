#!/bin/sh

echo 'Setting up your OS X preferences'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# set computer name
sudo scutil --set ComputerName "tress"

# Safari

# Include the develop menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# Set the home page to blank
defaults write com.apple.Safari HomePage -string "about:blank"

# Finder

# Show hidden files and file extensions by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always open everything in Finder's list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Dock

# Auto hide
defaults write com.apple.dock autohide -bool true

# Disable screenshot shadows
defaults write com.apple.screencapture disable-shadow -bool TRUE

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
