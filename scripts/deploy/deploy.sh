#!/bin/bash
set -eu
if [ ! -e ~/config ]; then
	mkdir ~/.config
fi

#Deploy vim config
ln -sfnv $DOTFILES/config/vim ~/.config/vim

#Deploy bat config
ln -sfnv $DOTFILES/config/bat ~/.config/bat
