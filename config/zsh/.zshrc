export PATH="$HOME/.local/bin:$PATH"

# tmux auto start
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session
fi
