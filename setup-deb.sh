#!/bin/sh

# install apps
sudo apt-get install -y trash-cli zsh

# copy necessary files
make install

# perform generic set up
sh ./setup.sh
