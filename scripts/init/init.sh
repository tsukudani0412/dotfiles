#!/bin/bash -eu
CURRENT=$(cd $(dirname $0);pwd)

if [ -e /etc/debian_release ]; then
	if [ -e /etc/lsb-release ]; then
		distri="ubuntu"
	else 
		distri="debian"
	fi
fi

${CURRENT}/${distri}.sh

yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

