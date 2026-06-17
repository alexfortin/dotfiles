export HOMEBREW_PREFIX="$(brew --prefix)"
export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export LC_ALL=en_US.UTF-8

#autoload -Uz compinit promptinit
#compinit -i
#zmodload zsh/complist

zstyle ':autocomplete:*' fzf 'yes'
zstyle ':autocomplete:tab:*' insert 'fuzzy'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true


# Tab autocomplete
setopt AUTO_MENU
setopt MENU_COMPLETE
bindkey '^I' complete-word

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
bindkey "^R" history-incremental-search-backward
unsetopt nomatch

# Options
setopt autocd
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

# Vi mode
set -o vi

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

zstyle ':znap:*' repos-dir ~/plugins

__git_files () { 
    _wanted files expl 'local files' _files     
}
