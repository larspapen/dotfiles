#! /usr/bin/env zsh

if [ "$(uname)" != "Darwin" ]
then
    echo "Aborting. These dotfiles are meant to be running on macOS"
    exit 1
fi

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
DOTFILES_PATH="${CURRENT_PATH}/${REPO_NAME}"
DOTFILES_PATH="${DOTFILES_PATH}/dotfiles"

# Install applications
if [ ! -f "$(which brew)" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

CLI_BREWS=(
    git
    gh
    htop
    mas
    neovim
    nvm
    pritunl
    python3
    tmux
    tree
    wget
    z
)

APP_BREWS=(
    1password
    alfred
    bitwarden
    caffeine
    db-browser-for-sqlite
    discord
    docker
    firefox
    github
    google-chrome
    iterm2
    microsoft-teams
    monitorcontrol
    mysqlworkbench
    postman
    pycharm
    rider
    spotify
    telegram-desktop
    virtualbox
    visual-studio-code
    vmware-fusion
    webstorm
    whatsapp
)

brew install $CLI_BREWS
brew install --cask $APP_BREWS

mas install 1295203466

if [[ ! "$(echo $SHELL)" == "/bin/zsh" && ! "$(echo $SHELL)" == "/usr/bin/zsh" ]]
then
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

compaudit | xargs chmod g-w

# Setup
mkdir "~/5Minds"
mkdir "~/dev"
mkdir "~/.ssh"

git clone git://github.com/larspapen/dotfiles.git $REPO_NAME
git config --global core.excludesfile '~/.gitignore'
git config --global pull.rebase true
git config --global init.defaultBranch main
git config --global advice.statusHints false

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap

ln -sf "${DOTFILES_PATH}/git/.gitignore" $HOME
ln -sf "${DOTFILES_PATH}/zsh/.zshrc" $HOME

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finish
echo "You may stillt want to configure the following things:"
echo "  - Request password after lock immediately"
echo "  - Run: 'compaudit | xargs chmod g-w' if there are insecure directories"
echo "Reboot."
