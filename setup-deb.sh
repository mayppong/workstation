#!/bin/sh

# install apps
sudo apt-get install -y trash-cli zsh

# copy necessary files
make install-deb

# perform generic set up
sh ./setup.sh
