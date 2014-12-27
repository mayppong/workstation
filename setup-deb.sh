#!/bin/sh
apt-get install trash-cli zsh

#
make install-deb

# Change default shell to zsh
chsh -s $(which zsh)

# Set up vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
