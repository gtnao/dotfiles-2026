#!/usr/bin/env bash
set -euo pipefail

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
