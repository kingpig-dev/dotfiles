#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

printf "\n${WHITE}==============================================================================

SETTING UP YOUR COMPUTER!

==============================================================================${NORMAL}\n"

# Fix macOS Mojave antialiased fonts
# printf "\n${MAGENTA}Fixing Mojave fonts to look normal again...${NORMAL}\n"
# eval "defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO"

# Show hidden dotfiles in finder
printf "\n${MAGENTA}Showing hidden files to be visible finder...${NORMAL}\n"
eval "defaults write com.apple.finder AppleShowAllFiles YES"
eval "killall Finder"

# Install XCode Command Line Tools
printf "\n${BLUE}Installing XCode Command Line Tools...${NORMAL}\n"
eval "xcode-select --install"

# Install Homebrew for easier macOS package management
printf "\n${YELLOW}Installing Homebrew...${NORMAL}\n"
eval '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# If this is an M1 mac
if [[ `uname -m` == 'arm64' ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "/Users/$USER/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install NVM
printf "\n${GREEN}Installing NVM...${NORMAL}\n"
eval "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"
eval "nvm install node --lts"
eval "nvm alias default node"

# Install Yarn for easier (and faster) Node.js dependency management
printf "\n${BLUE}Installing Yarn for easier (and faster) Node.js dependency management...${NORMAL}\n"
eval "brew install yarn --ignore-dependencies"

# Install Composer for easier PHP dependency management
printf "\n${MAGENTA}Installing Composer for easier PHP dependency management...${NORMAL}\n"
eval "brew install composer"

# Install Oh My Zsh
printf "\n${BLUE}Installing Oh My Zsh...${NORMAL}\n"
eval "sh -c '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'"

# Copy ZSH config
# printf "${YELLOW}Copying ZSH config into ~/.zshrc...${NORMAL}\n"
# eval "cp ./zshrc ~/.zshrc"

# Add global NPM packages
printf "\n${GREEN}Installing global npm packages...${NORMAL}\n"
eval "brew install spaceship"

# Refresh ZSH config
eval "source ~/.zshrc"

# Install fonts
eval "sh scripts/fonts.sh"

# Open links for apps that can't be downloaded via brew cask
printf "\n${BLUE}Opening links for apps to download...${NORMAL}\n"

# Browsers
eval "open https://www.google.com/chrome/"
eval "open https://www.mozilla.org/en-US/firefox/new/"

# Productivity
eval "open https://www.spectacleapp.com/"
eval "open https://clipy-app.com/"
eval "open https://www.alfredapp.com/"
eval "open https://1password.com/downloads/mac/"
eval "open https://itunes.apple.com/us/app/next-meeting/id1017470484?mt=12"
eval "open https://ticktick.com/about/download"
eval "open https://www.notion.so/desktop"

# Development
eval "open https://code.visualstudio.com/"
eval "open https://www.iterm2.com/"
eval "open https://www.getpostman.com/"
eval "open https://docs.docker.com/docker-for-mac/install/"
eval "open https://developer.apple.com/xcode/"
eval "open https://apps.apple.com/us/app/transmit-5/id1436522307?mt=12"

# Design
eval "open https://www.figma.com/downloads/"

# Communication
eval "open https://slack.com/downloads/mac"
eval "open https://apps.apple.com/app/apple-store/id1176895641"
eval "open https://zoom.us/download"

# Miscellaneous
eval "open https://www.spotify.com/us/download/mac/"


# Follow the instructions on GitHub to generate a new SSH key and add it to your Github account.
printf "\n${WHITE}==============================================================================

${GREEN}All set!

${WHITE}Make sure to follow the instructions on GitHub to generate a new SSH key and then add the key to your GitHub account.

==============================================================================${NORMAL}\n"

eval "open https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key"
eval "open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account"
