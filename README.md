# dotfiles
Repository to hold my Mac OS X configurations.

## Setup

1. Install xcode-select

    ```shell
    $xcode-select --install
    ```
1. Install [brew](https://brew.sh/)

1. Clone this repo to `$HOME`

   ```shell
   $git clone https://github.com/nithyanatarajan/dotfiles.git ${HOME}/dotfiles
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

1. Configure [ssh keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [gpg keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

   ```shell
   # Generate GPG key
   $gpg --full-generate-key
   # List keys to get the signing key ID
   $gpg --list-secret-keys --keyid-format=long
   # Export public key (add this to GitHub/GitLab)
   $gpg --armor --export <key-id>
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

- **Install essentials**: `make brew`
- **Install optional packages** (flutter, older JDKs, etc.): `make brew-optional`
- **Dump current state**: `brew bundle dump --file=homebrew/Brewfile --force`
- **Remove packages not in Brewfile**: `brew bundle cleanup --file=homebrew/Brewfile`
- **Remove packages not in either Brewfile**: `cat homebrew/Brewfile homebrew/Brewfile.optional | brew bundle cleanup --file=/dev/stdin`

> **Note**: `brew bundle cleanup` will flag optional packages for removal if run against the main Brewfile only. Add `--force` to actually remove. Without it, only previews what would be removed.

`brew bundle dump` captures not just brew packages but also vscode extensions and go packages. `brew bundle install` restores them by delegating to the appropriate tool:

| Prefix | Runs |
|--------|------|
| `tap` | `brew tap <name>` |
| `brew` | `brew install <name>` |
| `cask` | `brew install --cask <name>` |
| `vscode` | `code --install-extension <name>` |
| `go` | `go install <name>@latest` |
