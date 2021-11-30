#!/bin/zsh
set -eu

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.zinit}/zinit.git"
mkdir -p "$(dirname $ZINIT_HOME)"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

zsh -i -c "source ~/.zsh/zplugin.zsh"
curl -fsLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
