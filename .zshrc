# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit		# Use modern completion system
setopt print_eight_bit		# 日本語ファイル名等8ビットを通す
bindkey -v			# Vi キーバインド
export LANG=ja_JP.UTF-8		# 文字コードの指定
autoload -Uz colors && colors	# 色を使用出来るようにする
autoload -Uz zmv		#zmvで一括置換
alias zmv='noglob zmv -W'
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
unsetopt promptcr
#lsに色付け
export EXA_COLORS='di=01;34:da=1;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="exa -l -h -@ -m --git --icons --time-style=long-iso --group-directories-first"
alias l1="exa -1"
alias la="exa -l -h -a -@ -m --git --icons --time-style=long-iso --group-directories-first"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zsh/zplugin.zsh
source ~/.zsh/function.zsh

(( ! ${+functions[p10k]} )) || p10k finalize

#if (which zprof > /dev/null 2>&1) ;then
#  zprof
#fi
