#!/bin/bash -eu
CURRENT=$(cd $(dirname $0);pwd)
distri=""

if [ -e /etc/debian_release ] || [ -e /etc/debian_version ]; then
	if [ -e /etc/lsb-release ]; then
		distri="ubuntu"
	fi
fi

if [ ${distri} != "" ]; then
	${CURRENT}/${distri}.sh
fi

touch ${DOTFILES}/initialized
