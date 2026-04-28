#!/usr/bin/env bash
set -euo pipefail
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  exit 1
fi

if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update

brew bundle --file="$DOTFILES_DIR/Brewfile"

if ! command -v claude &>/dev/null; then
  curl -fSL https://claude.ai/install.sh | bash
fi
