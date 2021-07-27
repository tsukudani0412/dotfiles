# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz promptinit
promptinit
prompt adam1

autoload -Uz compinit		# Use modern completion system
compinit
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

#ヒストリ設定
setopt hist_reduce_blanks	# ヒストリに保存するときに余分なスペースを削除する
HISTFILE=$HOME/.zhistory
HISTSIZE=100000
SAVEHIST=1000000
setopt inc_append_history
setopt share_history

function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr

# zplug 
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto

zplug romkatv/powerlevel10k, as:theme, depth:1
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

(( ! ${+functions[p10k]} )) || p10k finalize
