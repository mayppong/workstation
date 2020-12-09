#!/usr/bin/sh

# copy necessary files
make install

# perform generic set up
sh ./setup.sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor

brew install --cask appcleaner discord docker google-chrome \
  slack visual-studio-code
