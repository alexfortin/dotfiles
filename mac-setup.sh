#!/bin/bash
echo "Installing..."
brew install git
brew install tree
brew install neovim
brew install zsh
brew install httpie
brew install docker
brew install docker-machine
brew install mongodb
brew install tmux
brew install wget
brew install azure-cli
brew install tig
brew install fasd
brew install jenv
brew install getantibody/tap/antibody
brew cask install minikube
brew cask install atom
brew cask install firefox
brew cask install intellij-idea
brew cask install iterm2
brew cask install virtualbox
brew cask install slack
brew cask install spotify
brew cask install karabiner-elements
brew cask install bettertouchtool
brew cask install alfred
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Done"

