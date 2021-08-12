#!/bin/bash -eu

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

CURRENT=$(cd $(dirname $0);pwd)
DISTRIB_ID=`cat /etc/lsb-release | grep DISTRIB_ID | cut -d "=" -f 2`

case "$DISTRIB_ID" in 
	[Uu]buntu* )
		$CURRENT/ubuntu.sh
		;;
	
	* )
		;;
esac

zsh ~/.zshrc
