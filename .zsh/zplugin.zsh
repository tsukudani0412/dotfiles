source "${ZINIT_HOME}/zinit.zsh"
### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit ice blockf
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/directory/init.zsh

zinit wait'0' from'gh-r' as'program' lucid light-mode for \
	bpick'bottom_x86_64-unknown-linux-gnu*' pick'btm' 'ClementTsang/bottom' \
	bpick'*x86_64-unknown-linux-musl*' pick'bandwhich' 'imsnif/bandwhich' \
	bpick'*linux_amd64*' pick'fzf' 'junegunn/fzf' \
	bpick'*x86_64-linux*' pick'procs' 'dalance/procs' \
	bpick'*linux-musl*' pick'hexyl*/hexyl' '@sharkdp/hexyl' \
	bpick'*linux-musl*' pick'bat*/bat' '@sharkdp/bat' \
  bpick'*x86_64-unknown-linux-gnu*' pick'eza' 'eza-community/eza' \
  bpick'*x86_64-unknown-linux-musl*' pick'delta*/delta' '@dandavison/delta'


zinit ice wait'2' lucid
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit ice wait'3' lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit cdclear -q

zinit light romkatv/powerlevel10k

zinit ice wait"!0" lucid atinit"zpcompinit; zpcdreplay -q"
