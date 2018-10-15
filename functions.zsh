# Update Zsh plugins
uz() {
  antibody bundle < ~/dotfiles/plugins.txt > ~/.zsh_plugins.sh
  antibody update
}
