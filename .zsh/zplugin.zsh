### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit ice blockf
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/directory/init.zsh

zinit from'gh-r' as'null' lucid for \
	extract sbin'fzf' junegunn/fzf  \
	sbin'btm' ClementTsang/bottom \
	sbin'bandwhich' imsnif/bandwhich \
	bpick'*lnx*' sbin'procs' dalance/procs \
	bpick'*musl*' mv'bin/exa -> exa' sbin'exa' ogham/exa \
	bpick'*linux-musl*' mv'hexyl*/hexyl -> hexyl' sbin'hexyl' @sharkdp/hexyl \
	bpick'*linux-musl*' mv'bat*/bat -> bat' sbin'bat' @sharkdp/bat

zinit ice wait'0' lucid
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit ice wait'0' lucid 
zinit snippet OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh
zinit ice wait'1' lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit cdclear -q
zinit ice wait'3' lucid
zinit light supercrabtree/k

zinit light romkatv/powerlevel10k

zinit ice wait"!0" lucid atinit"zpcompinit; zpcdreplay -q"
