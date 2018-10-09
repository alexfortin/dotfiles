eval $(docker-machine env blackbaud)

eval "$(fasd --init auto)"
eval $(minikube docker-env)
#eval "$(jenv init - --no-rehash)"
fasd_cache="$HOME/.fasd-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache"  ]; then
  fasd --init auto >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Prompt
ZSH_THEME="af-magic"

plugins=(git osx vi-mode)

# Path to your oh-my-zsh installation.
export ZSH=/Users/alex.fortin/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Vi mode
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Aliases
#alias grep='grep --color'
alias tmux="TERM=screen-256color-bce tmux"
alias java6="export JAVA_HOME=/opt/oracle/jdk6-current"
alias java8="export JAVA_HOME=/opt/oracle/jdk8-current"
alias gg='source ~/.zshrc' #hack since cache wont load for some reason
alias gr="./gradlew"
alias v='fasd -e nvim' # quick opening files with nvim
alias z='fasd_cd -d'
alias at='fasd -e atom'
alias tmux='tmux -2'
alias gitCleanBr='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias colemak='setxkbmap us -variant colemak'
alias us='setxkbmap us'
alias dm='docker-machine'
alias vim='nvim'
alias kube='kubectl'
alias ku='kubectl'
# Donation form reporting db: mongodb://t01afms01blkbdoc01:MM7cQI12usB3BAlWYrEDMZfg4tQCs4oPJpVnBRIIJYwMPkCMu0GyvyZyHKUVy3JdrGjpoeAlyWM5grKgKb5Ewg==@t01afms01blkbdoc01.documents.azure.com:10255/?ssl=true
#
export PATH="$HOME/.jenv/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/Users/alex.fortin/flutter_dev/flutter/bin:$PATH

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
