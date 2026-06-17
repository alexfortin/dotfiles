##To run
cd ~/dotfiles
chmod +x mac-setup.sh defaults/macos-defaults.sh
./mac-setup.sh

##Stow configs
cd ~/dotfiles/stow-packages
stow -R -v zsh git nvim kitty starship -t ~

if zsh settings are working try stow zsh

##Things to run after installs
nvim -> :Mason
This confirms service/tools
Open a file and press <leader>f to format; <leader>ff to fuzzy‑find files.

##File structure
~/dotfiles
├── asdf
│   └── tool-versions
├── BrewFile
├── init.vim
├── mac-setup-old.sh
├── mac-setup.sh
├── macos-defaults.sh
├── README.md
└── stow-packages
    ├── .DS_Store
    ├── git
    │   └── .gitconfig
    ├── kitty
    │   └── .config
    │       └── kitty
    │           ├── kitty.conf
    │           └── themes
    │               └── snazzy.conf
    ├── nvim
    │   └── .config
    │       ├── init.lua
    │       ├── init.vim
    │       ├── lua
    │       │   ├── core
    │       │   │   ├── keymaps.lua
    │       │   │   └── opts.lua
    │       │   └── plugins
    │       │       ├── init.lua
    │       │       ├── lsp.lua
    │       │       ├── telescope.lua
    │       │       ├── tooling.lua
    │       │       ├── treesitter.lua
    │       │       └── ui.lua
    │       └── nvim
    ├── starship
    │   └── .config
    │       └── starship.toml
    └── zsh
        ├── .zsh_plugins.txt
        ├── .zshrc
        ├── alias.zsh
        ├── functions.zsh
        └── options.zsh



