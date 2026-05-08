#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config ~/.apm ~/.claude
ln -sfn "$DOTFILES_DIR/config/git" ~/.config/git
ln -sfn "$DOTFILES_DIR/config/nvim" ~/.config/nvim
ln -sfn "$DOTFILES_DIR/config/zsh/.zshrc_mac" ~/.zshrc
ln -sfn "$DOTFILES_DIR/config/tmux" ~/.config/tmux
ln -sfn "$DOTFILES_DIR/config/starship.toml" ~/.config/starship.toml
ln -sfn "$DOTFILES_DIR/config/mise" ~/.config/mise
ln -sfn "$DOTFILES_DIR/config/wezterm" ~/.config/wezterm
ln -sfn "$DOTFILES_DIR/config/apm/apm.yml" ~/.apm/apm.yml
ln -sfn "$DOTFILES_DIR/config/claude/CLAUDE.md" ~/.claude/CLAUDE.md
