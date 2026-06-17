# Dotfiles

## Run setup

```bash
cd ~/dotfiles
chmod +x mac-setup.sh macos-defaults.sh
./mac-setup.sh
```

## Stow configs

```bash
cd ~/dotfiles/stow-packages
stow -R -v zsh git nvim kitty starship -t ~
```

If your zsh settings are already working and you only want to restow zsh:

```bash
stow -R -v zsh -t ~
```

## Post-install checks

1. Open Neovim and run `:Mason` to verify language servers and tooling.
2. Open a file and test keymaps:
   - `<leader>f` for format
   - `<leader>ff` for fuzzy file search

## File structure

```text
~/dotfiles
├── asdf
│   └── tool-versions
├── BrewFile
├── mac-setup.sh
├── macos-defaults.sh
├── README.md
└── stow-packages
    ├── git
    │   └── .gitconfig
    ├── kitty
    │   └── .config
    │       └── kitty
    │           ├── kitty.conf
    │           └── themes
    │               └── snazzy.conf
    ├── nvim
    │   └── .config
    │       └── nvim
    │           ├── init.lua
    │           ├── lazy-lock.json
    │           └── lua
    │               ├── core
    │               │   ├── keymaps.lua
    │               │   └── opts.lua
    │               └── plugins
    │                   ├── init.lua
    │                   ├── kitty.lua
    │                   └── ui.lua
    ├── starship
    │   └── .config
    │       └── starship.toml
    └── zsh
        ├── .zsh_plugins.txt
        ├── .zshrc
        ├── alias.zsh
        ├── functions.zsh
        └── options.zsh
```



