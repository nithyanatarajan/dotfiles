# Load exports
[ -f ~/.exports ] && source ~/.exports

# Load alias
[ -f ~/.sh_alias ] && source ~/.sh_alias

# Load functions
[ -f ~/.sh_functions ] && source ~/.sh_functions

# Load functions
[ -f ~/.projectrc ] && source ~/.projectrc

. "$HOME/.local/bin/env"
