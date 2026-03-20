# bob (neovim version manager)
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

export EDITOR="nvim"

# keybindings
bindkey '^F' autosuggest-accept

# aliases
alias v=nvim
alias z=zoxide
alias f=fzf
alias c=claude --dangerously-skip-permissions

# tmux coding cockpit: nvim (top-left), claude (top-right), terminal (bottom)
nic() {
  local session="${1:-$(basename "$PWD")}"
  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach -t "$session"
    return
  fi
  tmux new-session -d -s "$session" -x "$(tput cols)" -y "$(tput lines)"
  tmux split-window -h -t "$session"
  tmux split-window -v -f -t "$session"
  tmux resize-pane -t "$session:1.1" -x 85%
  tmux resize-pane -t "$session:1.3" -y 10%
  tmux send-keys -t "$session:1.1" 'nvim .' Enter
  tmux send-keys -t "$session:1.2" 'claude' Enter
  tmux select-pane -t "$session:1.3"
  tmux attach -t "$session"
}

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# rbenv
eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/bin:$PATH"

# sdkman
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
