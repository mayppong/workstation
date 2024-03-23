#!/bin/sh

# install apps
sudo apt-get install -y trash-cli zsh

# change default shell to zsh
chsh -s /bin/zsh

# copy necessary files
make install

# perform generic set up
sh ./setup.sh
