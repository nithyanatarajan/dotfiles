#!/usr/bin/env bash

# Load bashrc
[ -f ~/.bashrc ] && source ~/.bashrc

# Load profile
[ -f ~/.profile ] && source ~/.profile

complete -C /usr/local/bin/consul consul
