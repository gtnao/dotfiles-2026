#!/usr/bin/env bash
set -euo pipefail

cwd="$(tmux display-message -p '#{pane_current_path}')"

# operate on the current window; the active pane becomes the left column
left=$(tmux display-message -p '#{pane_id}')

# right column: 1/5 width, full height (split before subdividing left,
# so the right column spans top to bottom)
right=$(tmux split-window -h -t "$left" -l '20%' -c "$cwd" -P -F '#{pane_id}')

# left column: bottom 1/3 becomes the claude pane
claude_pane=$(tmux split-window -v -t "$left" -l '33%' -c "$cwd" -P -F '#{pane_id}')
nvim_pane="$left"

# right column: 4 equal rows. Each split places the new pane below the
# target; -l sizes the new pane so existing-pane height is preserved.
#   100% -> [25 | 75]  -> [25 | 25 | 50] -> [25 | 25 | 25 | 25]
r2=$(tmux split-window -v -t "$right" -l '75%' -c "$cwd" -P -F '#{pane_id}')
r3=$(tmux split-window -v -t "$r2"    -l '67%' -c "$cwd" -P -F '#{pane_id}')
r4=$(tmux split-window -v -t "$r3"    -l '50%' -c "$cwd" -P -F '#{pane_id}')

tmux send-keys -t "$nvim_pane"   'nvim' Enter
tmux send-keys -t "$claude_pane" 'claude --dangerously-skip-permissions' Enter

tmux select-pane -t "$nvim_pane"
