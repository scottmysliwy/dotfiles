#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#taps
brew tap clementtsang/bottom
brew install bottom
brew tap federico-terzi/espanso
brew install espanso

# Install desired applications
brew install htop httpie fd fzf exa bat neofetch neovim python ripgrep yabai skhd wget tmux
brew install --cask alacritty google-chrome utm webull brave-browser microsoft-remote-desktop vlc wezterm
brew install --cask font-sf-mono-nerd-font transmission vscodium 1password discord 



