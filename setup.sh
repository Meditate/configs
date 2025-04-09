#!/bin/bash

# Ask for sudo up front
sudo -v

echo "Installing Xcode Command Line Tools..."
xcode-select --install
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to PATH..."
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing essential packages..."
brew install git
brew install iterm2
brew install zsh
brew install tig

echo "Installing neovim"
brew install neovim
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim

echo "-- Install nvim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install Powerline fonts"

mkdir ../fonts
git clone https://github.com/powerline/fonts.git ../fonts
sh ../fonts/install.sh
brew install font-inconsolata-nerd-font

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



