typeset -Ugx path
path=(
  $HOME/.cargo/bin(N)
  $HOME/.local/bin(N)
  $path
)

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# starship (no wait - prompt must be available immediately)
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

# fzf
zinit ice wait lucid as"command" from"gh-r" \
  atclone"./fzf --zsh > fzf.zsh" \
  atpull"%atclone" src"fzf.zsh"
zinit light junegunn/fzf

# ghq
zinit ice wait lucid as"command" from"gh-r" pick"ghq*/ghq" \
  atclone"cp ghq*/misc/zsh/_ghq ." \
  atpull"%atclone"
zinit light x-motemen/ghq

# fzf + ghq directory jump
function _fzf-ghq() {
  local selected_dir=$(ghq list -p | fzf)
  if [ -n "${selected_dir}" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N _fzf-ghq
bindkey '^]' _fzf-ghq

# mise
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# sdkman
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# tmux auto start
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session
fi
