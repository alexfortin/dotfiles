#!/bin/bash
echo "Installing brew"
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

echo "Installing by brew"
brew install tree
brew install neovim
brew install zsh
brew install httpie
brew install docker
brew install docker-machine
brew install minikube
brew install mongodb
brew install tmux
brew install wget
brew install azure-cli
brew install tig
brew install getantibody/tap/antibody
brew cask install atom
brew cask install firefox
brew cask install intellij-idea
brew cask install iterm2
brew cask install virtualbox
brew cask install slack
brew cask install spotify
echo "Done"
