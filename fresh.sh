#!/bin/sh
# examples of dotfiles:
# https://github.com/driesvints/dotfiles#your-own-dotfiles
# https://github.com/geodimm/dotfiles

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
echo "checking oh-my-zsh is there.."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "installing oh-my-zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

echo "Checking Brew..."
# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "installing libraries with brew.."
brew bundle --file ./Brewfile

# link the wezterm config file with th one in the dotfiles
rm $HOME/.config/wezterm/wezterm.lua
ln -sw $HOME/.dotfiles/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua

# setting global gitignore
git config --global core.excludesfile ~/.dotfiles/.gitignore

# set up neovim config
echo "Setting up Neovim config..."
# Ensure the config directory exists
mkdir -p $HOME/.config

# Remove existing config if it's a directory or a link
rm -rf $HOME/.config/nvim

# Create the symlink
ln -sfn $HOME/.dotfiles/nvim $HOME/.config/nvim

# Install plugins headlessly for lazy.nvim
echo "Installing Neovim plugins via lazy.nvim..."
nvim --headless "+Lazy! sync" +qa

echo "Neovim setup complete."
