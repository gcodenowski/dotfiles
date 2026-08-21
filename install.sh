#!/bin/sh
# Bootstrap a fresh machine with these dotfiles via chezmoi.
#
# Usage:
#   ./install.sh                       # uses DOTFILES_REPO or the default
#   DOTFILES_REPO=git@github.com:you/dotfiles.git ./install.sh
set -eu

REPO="${DOTFILES_REPO:-git@github.com:gcodenowski/dotfiles.git}"
OS="$(uname -s)"

info() { printf '\n==> %s\n' "$1"; }

install_homebrew() {
    if command -v brew >/dev/null 2>&1; then
        return 0
    fi
    info "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
}

install_chezmoi() {
    if command -v chezmoi >/dev/null 2>&1; then
        return 0
    fi
    case "$OS" in
    Darwin)
        brew install chezmoi
        ;;
    Linux)
        mkdir -p "$HOME/.local/bin"
        curl -fsSL https://git.io/chezmoi-install | sh -s -- -b "$HOME/.local/bin"
        export PATH="$HOME/.local/bin:$PATH"
        ;;
    esac
}

case "$OS" in
Darwin)
    info "macOS detected"
    # Xcode CLT (needed for git/builds)
    if ! xcode-select -p >/dev/null 2>&1; then
        info "Installing Xcode Command Line Tools (follow the popup)"
        xcode-select --install || true
        echo "Re-run this script once installation finishes."
        exit 1
    fi

    install_homebrew
    install_chezmoi

    if [ -f "$(dirname "$0")/Brewfile" ]; then
        info "Installing packages from Brewfile"
        brew bundle --file="$(dirname "$0")/Brewfile"
    fi
    ;;
Linux)
    info "Linux detected"
    echo "Install your distribution's equivalents of the tools used by these"
    echo "dotfiles manually, e.g. on Debian/Ubuntu:"
    echo "  sudo apt install zsh git neovim kitty fastfetch fzf ripgrep eza \\"
    echo "       zoxide lazygit curl unzip"
    echo "(starship: curl -sS https://starship.rs/install.sh | sh)"
    install_chezmoi
    ;;
*)
    echo "Unsupported OS: $OS" >&2
    exit 1
    ;;
esac

info "Initializing chezmoi from $REPO"
chezmoi init --apply "$REPO"

info "Done. Restart your shell to pick up the new configuration."
