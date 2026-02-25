#!/usr/bin/env zsh

# starship configuration
eval "$(starship init zsh)"
[ -f ~/.zsh_completions ] && source ~/.zsh_completions

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

# http://zsh.sourceforge.net/Doc/Release/Options.html
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

[ -f ~/.secrets ] && source ~/.secrets

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
