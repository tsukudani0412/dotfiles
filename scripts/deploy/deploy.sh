#!/bin/zsh
set -eu
yes | sh -c "$(curl -fsSL https://git.io/zinit-install)"
zsh -i -c "source ~/.zsh/zplugin.zsh"
curl -fsLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
