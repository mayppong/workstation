#!/usr/bin/sh

# switch default shell over to zsh
chsh -s /bin/zsh

# set up vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
