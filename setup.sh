#!/usr/bin/sh

# switch default shell over to zsh
chsh -s /bin/zsh

# set up vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PluginInstall +qall
