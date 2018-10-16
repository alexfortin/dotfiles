eval $(docker-machine env blackbaud)

source ~/.zsh_plugins.sh
source ~/dotfiles/alias.zsh
source ~/dotfiles/functions.zsh
source ~/dotfiles/options.zsh

#figure out why this doesn't work in options.zsh
bindkey "^R" history-incremental-search-backward
