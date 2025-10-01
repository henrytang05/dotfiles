#!/usr/bin/env zsh

xcode-select --install

echo "Complete the installation of Xcode Command Line Tools before proceeding."
echo "Press enter to continue..."
read

# Set scroll as traditional instead of natural
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
killall Finder

# Set location for screenshots
mkdir "${HOME}/Desktop/Screenshots"
defaults write com.apple.screencapture location "${HOME}/Desktop/Screenshots"
killall SystemUIServer

# Faster hidding dock
defaults write com.apple.dock autohide-time-modifier -float 0.15 && killall Dock

# Enable focus on mouse hover
defaults write com.apple.Terminal FocusFollowsMouse -bool true
defaults write com.apple.x11 wm_ffm -bool true

# Mision control group app
defaults write com.apple.dock expose-group-apps -bool true && killall Dock
