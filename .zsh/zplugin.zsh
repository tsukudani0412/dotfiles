source "${ZINIT_HOME}/zinit.zsh"
### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit ice blockf
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/directory/init.zsh

zinit from'gh-r' as'program' lucid for \
	pick'btm' ClementTsang/bottom \
	pick'bandwhich' imsnif/bandwhich \
	bpick'*linux_amd64*' pick'fzf' 'junegunn/fzf' \
	bpick'*lnx*' pick'procs' dalance/procs \
	bpick'*musl*' pick'bin/exa' ogham/exa \
	bpick'*linux-musl*' pick'hexyl*/hexyl' @sharkdp/hexyl \
	bpick'*linux-musl*' pick'bat*/bat' @sharkdp/bat

zinit ice wait'0' lucid
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit ice wait'1' lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit cdclear -q
zinit ice wait'3' lucid
zinit light supercrabtree/k

zinit light romkatv/powerlevel10k

zinit ice wait"!0" lucid atinit"zpcompinit; zpcdreplay -q"
