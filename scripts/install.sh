#!/bin/bash
set -eu
DOTPATH=~/.dotfiles
GITHUB_URL=https://github.com/koki-koba/dotfiles.git
#zsh 確認
if !(type "make" > /dev/null 2>&1); then
    echo "make not found"
		exit
fi

# git が使えるなら git
if type "git" > /dev/null 2>&1; then
	if [ ! -e $DOTPATH ]; then
		git clone --recursive "$GITHUB_URL" "$DOTPATH"
	else
		cd $DOTPATH
		git pull
	fi

# 使えない場合は curl か wget を使用する
elif type "curl" > /dev/null 2>&1 || type "wget"> /dev/null 2>&1; then
	tarball="https://github.com/koki-koba/dotfiles/archive/refs/heads/main.tar.gz"

    # どっちかでダウンロードして，tar に流す
	if type "curl" > /dev/null 2>&1; then
		curl -L "$tarball"

	elif type "wget" >/dev/null 2>&1; then
		wget -O - "$tarball"

	fi | tar zxv

    # 解凍したら，DOTPATH に置く
	mv -f dotfiles-main "$DOTPATH"

else
	echo "curl or wget required"
	echo ""
	false
fi

cd $DOTPATH

echo "Initializing..."
echo ""
make init

echo "Deploying..."
echo ""
make deploy
