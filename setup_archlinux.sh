#! /bin/bash

# Isntall yay and packages
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

PACKAGES=(
    bitwarden
    discord
    dolphin
    fish
    firefox
    htop
    kitty
    kubectx
    man
    nerd-fonts-hasklig
    openssh
    reflector
    telegram-desktop
    ttf-apple-emoji
    visual-studio-code-bin
    wget
    whois
    zoxide
    zip
)

yay
yay -S $PACKAGES

# git stuff
REPO_PATH="/home/larspapen/dev/dotfiles"
git clone https://github.com/larspapen/dotfiles.git $REPO_PATH

git config --global core.excludesfile '~/.config/git/ignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK+aTK05grZ4V1JbtHqOD0j0KUWh4YAeoVL/Fw4PXqSh Lars@Papen-kordt.de'

# Create dirs and link files
mkdir "$HOME/dev"
mkdir "$HOME/.ssh"
mkdir "$HOME/.config"

mkdir "$HOME/.config/fish"
ln -sf "/Users/larspapen/dev/dotfiles/dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sf "/Users/larspapen/dev/dotfiles/dotfiles/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "/Users/larspapen/dev/dotfiles/dotfiles/fish/functions" "$HOME/.config/fish/functions"

# Link folders
ln -sf "/Users/larspapen/dev/dotfiles/dotfiles/git" "$HOME/.config/git"
