export DOTPATH=~/.dotfiles
export LANG=en_US.utf-8

# .bashrc
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
. "$HOME/.cargo/env"
