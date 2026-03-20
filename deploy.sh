#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config
ln -sfn "$DOTFILES_DIR/config/git" ~/.config/git
ln -sfn "$DOTFILES_DIR/config/nvim" ~/.config/nvim
ln -sfn "$DOTFILES_DIR/config/zsh/.zshrc" ~/.zshrc
ln -sfn "$DOTFILES_DIR/config/tmux" ~/.config/tmux
ln -sfn "$DOTFILES_DIR/config/starship.toml" ~/.config/starship.toml
