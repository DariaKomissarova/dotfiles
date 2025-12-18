#!/bin/sh

echo "Setting up your Mac..."

# 1. Check for Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# 2. Check for Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 3. Update and Bundle
brew update
echo "Installing dependencies from Brewfile..."
brew bundle --file ./Brewfile

# 4. Symlink Configurations
echo "Creating symlinks..."
# ZSH
ln -sfn $HOME/.dotfiles/.zshrc $HOME/.zshrc
# WezTerm
mkdir -p $HOME/.config/wezterm
ln -sfn $HOME/.dotfiles/wezterm/wezterm.lua $HOME/.wezterm.lua
# Git Global Ignore
ln -sfn $HOME/.dotfiles/.gitignore_global $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

# 5. Neovim Setup
echo "Linking Neovim..."
mkdir -p $HOME/.config/nvim
# Ensure your dotfiles has the 'lua' directory structure!
ln -sfn $HOME/.dotfiles/nvim $HOME/.config/nvim

echo "Installing Neovim plugins..."
# Use the correct LazyVim command to sync plugins headlessly
nvim --headless "+Lazy! sync" +qa

echo "Setup Complete!"
