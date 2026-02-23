#!/usr/bin/env zsh

# Load zshrc
#[ -f ~/.zshrc ] && source ~/.zshrc

# Load profile
[ -f ~/.profile ] && source ~/.profile

eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"
