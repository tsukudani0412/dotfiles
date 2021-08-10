#!/bin/sh
CARGO_PACKAGES="exa bat bandwhich procs bottom bingrep hexyl"
echo -n "Install zinit? (y/n)"
echo ""
read ANS

case $ANS in 
  [Yy]* )
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    ;;
  * )
    ;;
esac

echo -n "Install cargo? (y/n)"
echo ""
read ANS 

case $ANS in
  [Yy]* )
    curl https://sh.rustup.rs -sSf | sh
    source ~/.zshrc
    ;;
  *)
    ;;
esac

echo -n "Install cargo packages($CARGO_PACKAGES)? (y/n) "
echo ""
read ANS

case $ANS in
  [Yy]* )
    cargo install $CARGO_PACKAGES
    ;;

  *)
    ;;
esac
