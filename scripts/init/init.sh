#!/bin/bash -eu

CURRENT=$(cd $(dirname $0);pwd)
DISTRIB_ID=`cat /etc/lsb-release | grep DISTRIB_ID | cut -d "=" -f 2`

case "$DISTRIB_ID" in 
	[Uu]buntu* )
		$CURRENT/ubuntu.sh
		;;
	
	* )
		;;
esac

yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
