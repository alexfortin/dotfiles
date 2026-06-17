#zmodload zsh/zprof
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
export JAVA_HOME="${$(asdf which java)%/bin/java}"
export PATH="$JAVA_HOME/bin:$PATH"
eval "$(starship init zsh)"
[ -f ~/dotfiles/alias.zsh ]     && source ~/dotfiles/alias.zsh
[ -f ~/dotfiles/functions.zsh ] && source ~/dotfiles/functions.zsh
[ -f ~/dotfiles/options.zsh ]   && source ~/dotfiles/options.zsh
ANTIDOTE_PATH="$(brew --prefix antidote)/share/antidote/antidote.zsh"
[ -f "$ANTIDOTE_PATH" ] && source "$ANTIDOTE_PATH"
[ -f ~/.zsh_plugins.txt ] && antidote load <~/.zsh_plugins.txt
FZF_SHELL_DIR="$(brew --prefix fzf)/shell"
[ -f "$FZF_SHELL_DIR/key-bindings.zsh" ] && source "$FZF_SHELL_DIR/key-bindings.zsh"

autoload -Uz compinit
compinit -i
zmodload zsh/complist

eval "$(zoxide init zsh)"
#zprof

