#!/bin/sh

# install apps
apt-get install trash-cli zsh

# copy necessary files
make install-deb

# perform generic set up
sh ./setup.sh
