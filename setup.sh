#!/usr/bin/sh

# install nix
curl --proto '=https' --tlsv1.2 -sSf \
  -L https://install.determinate.systems/nix \
  | sh -s -- install
nix run nix-darwin -- switch --flake ./macos

# set up vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
