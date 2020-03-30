# Update Zsh plugins
uz() {
  rm ~/.zsh_plugins.sh
  antibody bundle < ~/dotfiles/plugins.txt > ~/.zsh_plugins.sh
  antibody update
}

capture() {
    sudo dtrace -p "$1" -qn '
        syscall::write*:entry
        /pid == $target && arg0 == 1/ {
            printf("%s", copyinstr(arg1, arg2));
        }
    '
}
