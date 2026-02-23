.PHONY: all
all: help

IGNORE_LIST=-E homebrew -E iterm -E tmux -E tmux_local -E tmuxp -E ssh -E configurations
IGNORE_EXTN=--ignore=".tmpl"

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

brew: ## Install brew packages
	cd homebrew && brew bundle install

install: ## Wireup all dotfiles using stow
	fd --type d . --max-depth 1 $(IGNORE_LIST) | xargs -I {} stow $(IGNORE_EXTN) --verbose {}
	@echo "🚀🚀🚀 Successfully linked all the dot-files, enjoy 👏👏👏"

update: ## Re-wireup all dotfiles using stow
	fd --type d . --max-depth 1 $(IGNORE_LIST) | xargs -I {} stow $(IGNORE_EXTN) --verbose -R {}
	@echo "🚀🚀🚀 Successfully relinked all the dot-files, enjoy 👏👏👏"

tmuxc: ## Configure tmux
	brew install tmuxp
	stow --dir=tmux --target=${HOME} --verbose --ignore=".git[^\s]+" --ignore=".local" .tmux
	stow --verbose tmux_local

vim: ## Setup spacevim
	curl -sLf https://spacevim.org/install.sh | bash

vimu: ## Remove spacevim
	curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall