#!/bin/sh

# This script will install some vital components that I use on all my Arch installations.

# Base components
echo "Installing base components...\n"
pacman -Syu && pacman -S base-devel git nodejs fastfetch neovim vim zsh curl wget stow
echo "Done.\n"

# Change default shell
echo "Changing default shell...\n"
chsh -s /bin/zsh
echo "Done.\n"

# Install yay
echo "Installing AUR helper...\n"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "Done.\n"

# Install Oh My Zsh
echo "Installing omz...\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "Done.\n"

# Clone config repos
echo "Setting configs...\n"
cd ~
git clone https://github.com/MrVideo/arch-dotfiles.git
git clone https://github.com/MrVideo/nvim-config.git

# Stow config files
cd arch-dotfiles
stow .

cd ~
cd nvim-config
stow .
echo "Done.\n"

# Install Oh My Zsh plugins
echo "Installing omz plugins...\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Done.\n"
