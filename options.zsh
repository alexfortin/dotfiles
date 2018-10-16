# Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' insert-tab false
zmodload zsh/complist

# History
HISTSIZE=10000 # Lines of history to keep in memory for current session
HISTFILESIZE=10000 # Number of commands to save in the file
SAVEHIST=10000 # Number of history entries to save to disk
HISTFILE=~/.zsh_history # Where to save history to disk
HISTDUP=erase # Erase duplicates in the history file
setopt histignoredups # Ignore duplicates

# Options
setopt auto_cd
setopt cdable_vars
setopt extendedglob
setopt inc_append_history
setopt share_history
setopt append_history
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt pushdsilent
setopt auto_list
setopt auto_menu
setopt always_to_end

# Use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# fasd
eval "$(fasd --init auto)"
fasd_cache="$HOME/.fasd-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache"  ]; then
  fasd --init auto >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# jenv
eval "$(jenv init -)"
export PATH=”$HOME/.jenv/bin:$PATH”
