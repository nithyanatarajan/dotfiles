#!/usr/bin/env bash

# starship configuration
eval "$(starship init bash)"
# Setup direnv
eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
complete -C /usr/local/bin/vault vault

function pet-select() {
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'

## bash history.
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows

#export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
#shopt -s histappend                      # when shell exists, append to history file, don't overwrite it

eval "$(fzf --bash)"

eval "$(direnv hook bash)"

. "$HOME/.local/bin/env"
