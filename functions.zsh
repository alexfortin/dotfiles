# Update Zsh plugins
uz() {
  rm ~/.zsh_plugins.sh
  antibody bundle < ~/dotfiles/plugins.txt > ~/.zsh_plugins.sh
  antibody update
}
