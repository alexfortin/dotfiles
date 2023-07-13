# export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/node@16/bin:$PATH"

# Completions
autoload -Uz compinit promptinit; promptinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

prompt pure

zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
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
setopt hist_find_no_dups
setopt histignoredups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt no_beep
setopt share_history
setopt noclobber
setopt histignoredups # Ignore duplicates
bindkey "^R" history-incremental-search-backward
unsetopt nomatch

# Options
setopt interactivecomments
setopt auto_cd
setopt cdable_vars
setopt extended_glob
setopt menu_complete
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

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

#export NVM_DIR="$HOME/.nvm"
#. "$(brew --prefix nvm)/nvm.sh"
