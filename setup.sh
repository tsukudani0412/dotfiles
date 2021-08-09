#!/bin/sh

ln -s ~/shell-env/.zshrc ~/
ln -s ~/shell-env/.zshenv ~/
ln -s ~/shell-env/.p10k.zsh ~/
ln -s ~/shell-env/.vimrc ~/
ln -s ~/shell-env/.vim ~/
ln -s ~/shell-env/.tmux.conf ~/

mkdir ~/.config
ln -s ~/shell-env/.config/bat ~/.config/
