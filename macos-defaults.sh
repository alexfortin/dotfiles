#!/usr/bin/env bash
set -euo pipefail

echo "⚙️  Configuring macOS defaults..."

# Dock: position left, second smallest size, magnification off
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 36           # second smallest (default is 64, min is 16)
defaults write com.apple.dock magnification -bool false

# Dock: minimize to application, auto-hide
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock autohide -bool true

# Key repeat (fast)
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 4
defaults write -g InitialKeyRepeat -int 10

# Finder: show hidden files, path bar, extensions
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Screenshots: PNG to ~/Screenshots
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location "${HOME}/Screenshots"
defaults write com.apple.screencapture type -string "png"

# Scrolling: natural scrolling OFF
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Apply changes
killall Dock || true
killall Finder || true

echo "✅ macOS defaults applied."

