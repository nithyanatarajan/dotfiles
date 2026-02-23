# Load exports
[ -f ~/.exports ] && source ~/.exports

# Load alias
[ -f ~/.sh_alias ] && source ~/.sh_alias

# Load functions
[ -f ~/.sh_functions ] && source ~/.sh_functions

# Load project specific configurations
[ -f ~/.projectrc ] && source ~/.projectrc

. "$HOME/.local/bin/env"
