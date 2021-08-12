#!/bin/bash
set -eu
DOTPATH=~/.dotfiles
GITHUB_URL=https://github.com/koki-koba/dotfiles
#zsh 確認
if !type"zsh" > /dev/null 2>&1; then
    echo "zsh not found"
		exit
fi
# git が使えるなら git
if type "git" > /dev/null 2>&1; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif type "curl" > /dev/null 2>&1 || type "wget"> /dev/null 2>&1; then
    tarball="https://github.com/koki-koba/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if type "curl" > /dev/null 2>&1; then
        curl -L "$tarball"

    elif type "wget" >/dev/null 2>&1; then
        wget -O - "$tarball"

    fi | tar zxv

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    echo "curl or wget required"
    echo ""
    false
fi

if [ ! -e $DOTPATH ]; then
    echo "not found: $DOTPATH"
    echo ""
    false
fi

cd ~/.dotfiles

echo "Initializing..."
echo ""
zsh make init

echo "Deploying..."
echo ""
zsh make deploy
