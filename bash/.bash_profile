#!/usr/bin/env bash

# Load bashrc
[ -f ~/.bashrc ] && source ~/.bashrc

# Load profile
[ -f ~/.profile ] && source ~/.profile


[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
