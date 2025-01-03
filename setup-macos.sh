#!/bin/zsh

# copy necessary files
make install

# perform generic set up
sh ./setup.sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor

brew install byobu
brew install --cask \
  appcleaner keeweb opentmtp \
  google-chrome discord slack vlc \
  docker visual-studio-code
