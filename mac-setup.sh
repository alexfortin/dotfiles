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
brew install fzf
brew install getantibody/tap/antibody
brew install --cask minikube
brew install --cask atom
brew install --cask firefox
brew install --cask intellij-idea
brew install --cask iterm2
brew install --cask slack
brew install --cask spotify
brew install --cask bettertouchtool
brew install --cask alfred
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
npm install --global pure-prompt

## install fzf hotkeys
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## In nvim run PlugInstall
### symlink .gitconfig, .tmux.config, nvimrc -> .config/nvim/init.vim
echo "Done"

