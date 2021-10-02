#!/bin/bash -eu
CURRENT=$(cd $(dirname $0);pwd)

if [ -e /etc/debian_release ] || [ -e /etc/debian_version ]; then
	if [ -e /etc/lsb-release ]; then
		distri="ubuntu"
	else 
		#distri="debian"
	fi
fi

if [ ${distri} != "" ]; then
	${CURRENT}/${distri}.sh
fi

touch $DOTFILES/initialized
