export DOTPATH=~/.dotfiles
export LANG=en_US.utf-8
export PATH=$PATH:$HOME/.local/bin
export ZINIT_HOME=~/.zinit/zinit.git
export DENO_INSTALL=~/.deno
export PATH="$DENO_INSTALL/bin:$PATH"
#history
HISTFILE=$ZDOTDIR/.zsh_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt inc_append_history
. "$HOME/.cargo/env"
