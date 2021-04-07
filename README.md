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
