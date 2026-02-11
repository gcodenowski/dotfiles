#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."

### Essentials
brew install ffmpeg
brew install lua
brew install eza
brew install python 
brew install git 
brew install gitleaks
brew install go
brew install skhd
brew install yabai
brew install borders
brew install sketchybar
brew install svim
brew install neovim
brew install stow
brew install wget
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-vi-mode

## Casks
brew install --cask kitty
brew install --cask vscode

## Office
brew install --cask spotify
brew install --cask calibre
brew install --cask obsidian
brew install --cask libreoffice

## Fonts
brew install --cask sf-symbols
brew install --cask font-sf-pro
brew install --cask font-fira-code

## Niceties
brew install btop
brew install spicetify-cli
brew install cbonsai
brew install cmatrix
brew install pipes-sh

# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:gcodenowski/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout main

# Start Services
echo "Starting Services (grant permissions)..."
yabai --start-service # Will start borders too
skhd --start-service
brew services start sketchybar
brew services start svim



echo "Installation Complete!"
