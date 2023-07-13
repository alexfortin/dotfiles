# zmodload zsh/zprof
if which jenv > /dev/null; then eval "$(jenv init - --no-rehash)"; fi

source ~/.zsh_plugins.sh
source ~/dotfiles/alias.zsh
source ~/dotfiles/functions.zsh
source ~/dotfiles/options.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zprof
