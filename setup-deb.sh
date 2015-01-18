#!/bin/sh

# copy necessary files
make install-deb

# perform generic set up
sh ./setup.sh

# install apps
apt-get install trash-cli zsh
