#zmodload zsh/zprof
#eval "$(jenv init - --no-rehash)"

#[[ -r ~/Repos/znap/znap.zsh ]] ||
#    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/.zsh_plugins.sh
source ~/dotfiles/alias.zsh
source ~/dotfiles/functions.zsh
source ~/dotfiles/options.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#zprof

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"



# Load Angular CLI autocompletion.
#source <(ng completion script)
