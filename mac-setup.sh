#!/usr/bin/env bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO"; exit 1' ERR

echo "🔧 Bootstrapping dev Mac..."

# --- Detect architecture & Homebrew prefix -----------------------------------
ARCH="$(uname -m)"
if [[ "$ARCH" == "arm64" ]]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/usr/local"
fi

# --- Ensure Homebrew shellenv for this session --------------------------------
if [[ -d "$BREW_PREFIX" ]]; then
  eval "$($BREW_PREFIX/bin/brew shellenv)"
fi

# --- Xcode Command Line Tools -------------------------------------------------
if ! xcode-select -p >/dev/null 2>&1; then
  echo "📦 Installing Xcode Command Line Tools..."
  xcode-select --install || true
  until xcode-select -p >/dev/null 2>&1; do sleep 5; done
fi

# --- (Apple Silicon only) Rosetta 2 for x86 tools (optional but handy) -------
if [[ "$ARCH" == "arm64" ]]; then
  if ! /usr/bin/pgrep oahd >/dev/null 2>&1; then
    echo "🧩 Installing Rosetta 2 (for x86-only tools)..."
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license || true
  fi
fi

brew update
brew analytics off

# --- Brewfile -----------------------------------------------------------------
DOTFILES="${HOME}/dotfiles"
BREWFILE="${DOTFILES}/Brewfile"
echo "📜 Running brew bundle..."
brew bundle --file="$BREWFILE"

# --- Stow (symlinks) ----------------------------------------------------------
echo "🧩 Symlinking dotfiles via stow..."
cd "${DOTFILES}/stow-packages"
PACKAGES=(zsh git nvim kitty starship)     # add/remove packages as needed
for pkg in "${PACKAGES[@]}"; do
  stow -R -v "$pkg" -t "${HOME}"
done

# --- Default shell to Homebrew zsh --------------------------------------------
ZSH_PATH="$(command -v zsh || true)"
if [[ -n "${ZSH_PATH}" ]]; then
  if ! grep -q "${ZSH_PATH}" /etc/shells; then
    echo "➕ Adding ${ZSH_PATH} to /etc/shells (sudo)..."
    echo "${ZSH_PATH}" | sudo tee -a /etc/shells >/dev/null
  fi
  if [[ "$SHELL" != "${ZSH_PATH}" ]]; then
    echo "👤 Setting default shell to ${ZSH_PATH}..."
    chsh -s "${ZSH_PATH}"
  fi
fi

# --- fzf keybindings & completion (prefix-aware) ------------------------------
if brew list fzf >/dev/null 2>&1; then
  echo "⌨️  Installing fzf keybindings..."
  "$BREW_PREFIX/opt/fzf/install" --key-bindings --completion --no-update-rc --no-bash --no-fish
fi

# --- Neovim: lazy.nvim bootstrap ---------------------------------------------
NVIM_CONFIG_DIR="${HOME}/.config/nvim"
LAZY_DIR="${HOME}/.local/share/nvim/lazy/lazy.nvim"
mkdir -p "${NVIM_CONFIG_DIR}"
if [[ ! -d "${LAZY_DIR}" ]]; then
  echo "🧩 Bootstrapping lazy.nvim..."
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "${LAZY_DIR}"
fi

# --- asdf runtimes ------------------------------------------------------------
# Link repo-tracked tool versions (if present), then install
mkdir -p "${HOME}/.asdf"
if [[ -f "${DOTFILES}/asdf/tool-versions" ]]; then
  ln -sf "${DOTFILES}/asdf/tool-versions" "${HOME}/.tool-versions"
fi

# Initialize asdf for this session
if [[ -f "$BREW_PREFIX/opt/asdf/libexec/asdf.sh" ]]; then
  . "$BREW_PREFIX/opt/asdf/libexec/asdf.sh"
fi


asdf plugin add java || true

# Ask asdf for latest Temurin 17 
LATEST_TEMURIN_17="$(asdf latest java temurin-17 || true)"
if [[ -n "${LATEST_TEMURIN_17}" ]]; then
  echo "📦 Installing Java ${LATEST_TEMURIN_17} (Temurin 17)..."
  asdf install java "${LATEST_TEMURIN_17}" || true
  echo "🌍 Setting global Java ${LATEST_TEMURIN_17}..."
  asdf set -u java "${LATEST_TEMURIN_17}"
else
  echo "⚠️ Could not resolve latest Temurin 17 via asdf; skipping asdf Java."
fi

# Install plugins & versions declared in .tool-versions (safe to re-run)
if [[ -f "${HOME}/.tool-versions" ]]; then
  echo "🧱 Installing asdf runtimes from .tool-versions..."
  cut -d' ' -f1 "${HOME}/.tool-versions" | while read -r plugin; do
    asdf plugin add "$plugin" || true
  done
  asdf install
fi

# --- macOS defaults -----------------------------------------------------------
if [[ -x "${DOTFILES}/macos-defaults.sh" ]]; then
  echo "🛠  Applying macOS defaults..."
  sh "${DOTFILES}/macos-defaults.sh"
else
  echo "ℹ️  No macOS defaults script found or not executable."
fi

# --- Path corrections for tools used by your config ---------------------------
# zoxide/fzf runtime paths (prefix-aware)
if [[ -d "$BREW_PREFIX/opt/fzf" ]]; then
  # Neovim uses lua config now; keep Zsh integration:
  FZF_SHELL_DIR="$BREW_PREFIX/opt/fzf/shell"
  [[ -f "$FZF_SHELL_DIR/key-bindings.zsh" ]] && source "$FZF_SHELL_DIR/key-bindings.zsh"
  [[ -f "$FZF_SHELL_DIR/completion.zsh"   ]] && source "$FZF_SHELL_DIR/completion.zsh"
fi

echo "✅ Setup complete."

