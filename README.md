# dotfiles
Repository to hold my Mac OS X configurations.

## Setup

1. Install xcode-select

    ```shell
    $xcode-select --install
    ```
1. Install [brew](https://brew.sh/)

1. Configure ssh keys and gpg keys

1. Clone this repo to `$HOME`

   ```shell
   $git clone git@github.com:nithyanatarajan/dotfiles.git ${HOME}/dotfiles
   ```

## Usage

1. To install brew packages

   ```shell
   $make brew
   ```

1. To link all dotfiles

   ```shell
   $make install
   ```

1. Configure git

   ```shell
   # Copy the template and fill in the placeholders
   $cp git/.gitconfig.tmpl ~/.gitconfig
   # Replace $GPGKey with your GPG signing key (use `gpg --list-secret-keys`)
   # Replace $PROJECT_GIT with your project git host path (e.g. gitlab.com/org)

   # For project-specific git config (e.g. different email for work repos)
   $cp git/.gitconfig.proj.tmpl ~/Projects/$PROJECT_GIT/.gitconfig
   # Replace $PROJECT_EMAIL with your work email
   ```

1. Configure iterm2

   1. Refer [here](https://stackoverflow.com/a/23356086) (or)
   2. `cp iterm/com.googlecode.iterm2.plist $HOME/Library/Preferences`

1. Configure [tmux](https://github.com/gpakosz/.tmux)

   ```shell
   $git submodule init
   $git submodule update
   $make tmuxc
   ```

1. Other apps
   1. [meeter](https://trymeeter.com/)
   2. [clocker](https://github.com/n0shake/Clocker)
   3. [fanny](https://github.com/DanielStormApps/Fanny)

## Appendix

### Brewfile

The `Brewfile` is managed via [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle).

- **Dump current state**: `brew bundle dump --file=homebrew/Brewfile --force`
- **Restore on a new machine**: `make brew` (or `brew bundle install --file=homebrew/Brewfile`)

`brew bundle dump` captures not just brew packages but also vscode extensions and go packages. `brew bundle install` restores them by delegating to the appropriate tool:

| Prefix | Runs |
|--------|------|
| `tap` | `brew tap <name>` |
| `brew` | `brew install <name>` |
| `cask` | `brew install --cask <name>` |
| `vscode` | `code --install-extension <name>` |
| `go` | `go install <name>@latest` |
