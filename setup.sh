#!/bin/sh

# Make sure we are in the home directory
cd ~

# First, install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Run yay to update package databases and upgrade all packages
yay -Syu --noconfirm

# Then, use the installed packages list to install all packages
yay -S --noconfirm - < ~/installed_packages.txt

# Move back to home directory
cd ~

# Clone neovim configuration repo
git clone https://github.com/MrVideo/nvim-config.git

# Use stow to symlink all dotfiles
cd ~/arch-dotfiles
stow -t "$HOME" home
sudo stow t / system

# Now install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone all plugin repos for oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Clone theme repo for oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
