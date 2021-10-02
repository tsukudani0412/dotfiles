#!/bin/bash
set -eu
ESC=$(printf '\033')
DOTPATH=~/.dotfiles
GITHUB_URL="https://github.com/koki-koba/dotfiles.git"

printf "${ESC}[34m%s${ESC}[m" ' - ' && printf "${ESC}[3;4m%s${ESC}[m\n" 'Downloading dotfiles...'
# git が使えるなら git
if type "git" > /dev/null 2>&1; then
	if [ ! -e $DOTPATH ]; then
		git clone --recursive "$GITHUB_URL" "$DOTPATH"
	else
		cd $DOTPATH
		git pull
	fi

else
	tarball="https://github.com/koki-koba/dotfiles/archive/refs/heads/main.tar.gz"
	curl -L "$tarball" | tar zxv
	mv -f dotfiles-main "$DOTPATH"
	cd $DOTPATH
fi

if [ -e ${DOTPATH}/initialized ];then
	printf "\n${ESC}[34m%s${ESC}[m" ' - ' && printf "${ESC}[3;4m%s${ESC}[m\n" 'Skipped initialize process.'
else
	printf "\n${ESC}[34m%s${ESC}[m" ' - ' && printf "${ESC}[3;4m%s${ESC}[m\n" 'Initializing...'
	make init
fi

printf "\n${ESC}[34m%s${ESC}[m" ' - ' && printf "${ESC}[3;4m%s${ESC}[m\n" 'Deploying dotfiles...'
make deploy
