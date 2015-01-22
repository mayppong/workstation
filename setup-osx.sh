#!/usr/bin/sh

# copy necessary files
make install

# perform generic set up
sh ./setup.sh

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install google-chrome google-drive google-hangouts keepassx0 vagrant virtualbox colloquy sublime-text3
