#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl wget build-essential unzip jq just

# neovim (AppImage, extracted)
if ! command -v nvim &>/dev/null; then
  tmp="$(mktemp -d)"
  curl -LO --output-dir "$tmp" https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod u+x "$tmp/nvim-linux-x86_64.appimage"
  cd "$tmp"
  ./nvim-linux-x86_64.appimage --appimage-extract
  sudo rm -rf /opt/nvim
  sudo mv squashfs-root /opt/nvim
  sudo ln -sfn /opt/nvim/AppRun /usr/local/bin/nvim
  rm -rf "$tmp"
fi

# zsh
if ! command -v zsh &>/dev/null; then
  sudo apt install -y zsh
fi
if [ "$(basename "$SHELL")" != "zsh" ]; then
  chsh -s "$(which zsh)"
fi

# tmux
if ! command -v tmux &>/dev/null; then
  sudo apt install -y tmux
fi

# claude code
if ! command -v claude &>/dev/null; then
  curl -fSL https://claude.ai/install.sh | bash
fi

"$DOTFILES_DIR/deploy.sh"

if [ "$(basename "$SHELL")" != "zsh" ]; then
  exec zsh
fi
