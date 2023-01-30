export EDITOR="vim"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672"
export EXA_COLORS='di=01;34:da=1;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=249' 

alias cat="bat"
alias ls="exa -h -@ -m --git --icons --time-style=long-iso --group-directories-first"
alias l1="ls -1"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias fvim='vim $( fzf --ansi --preview "bat -f -r :30 {}" )'
alias vi='nvim'
alias mtr='mtr -z -r'
