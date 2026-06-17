#zmodload zsh/zprof
if [[ -d /opt/homebrew ]]; then
	export HOMEBREW_PREFIX="/opt/homebrew"
else
	export HOMEBREW_PREFIX="/usr/local"
fi

export PATH="${HOMEBREW_PREFIX}/bin:/usr/local/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
if command -v asdf >/dev/null 2>&1; then
	JAVA_BIN="$(asdf which java 2>/dev/null || true)"
	if [[ -n "$JAVA_BIN" ]]; then
		export JAVA_HOME="${JAVA_BIN%/bin/java}"
		export PATH="$JAVA_HOME/bin:$PATH"
	fi
fi

eval "$(starship init zsh)"
[ -f ~/dotfiles/alias.zsh ]     && source ~/dotfiles/alias.zsh
[ -f ~/dotfiles/functions.zsh ] && source ~/dotfiles/functions.zsh
[ -f ~/dotfiles/options.zsh ]   && source ~/dotfiles/options.zsh
ANTIDOTE_PATH="${HOMEBREW_PREFIX}/share/antidote/antidote.zsh"
[ -f "$ANTIDOTE_PATH" ] && source "$ANTIDOTE_PATH"
[ -f ~/.zsh_plugins.txt ] && antidote load <~/.zsh_plugins.txt
FZF_SHELL_DIR="${HOMEBREW_PREFIX}/opt/fzf/shell"
[ -f "$FZF_SHELL_DIR/key-bindings.zsh" ] && source "$FZF_SHELL_DIR/key-bindings.zsh"

autoload -Uz compinit
compinit -i
zmodload zsh/complist

eval "$(zoxide init zsh)"
#zprof

