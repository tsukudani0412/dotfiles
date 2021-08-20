function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONNECTION" ]; }

function tmux_automatically_attach_session()
{
	if is_screen_or_tmux_running; then
		! is_exists 'tmux' && return 1

		if is_tmux_runnning; then
			echo "$(tmux -V) created session $(tmux display-message -p '#S')"

		elif is_screen_running; then
			echo "This is on screen."
		fi

	else
		if shell_has_started_interactively && ! is_ssh_running; then
			if ! is_exists 'tmux'; then
				echo 'Error: tmux command not found' 2>&1
				return 1
			fi

			if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*[])]$'; then
				# detached session exists
				REPLY=`{ tmux list-sessions; echo "C: Create session"; echo "K: Kill session" } | \
					~/.zinit/polaris/bin/fzf --reverse --ansi | \
					cut -d ":" -f 1`

				if [[ "$REPLY" =~ ^[0-9]+$ ]]; then
					exec tmux attach -t "$REPLY"

				elif [[ "$REPLY" == "C" ]]; then
					tmux_create_session

				elif [[ "$REPLY" == "K" ]]; then
					tmux_kill_session
				fi

			else
				tmux_create_session
			fi
		fi
	fi
}

function tmux_create_session()
{
	if is_osx && is_exists 'reattach-to-user-namespace'; then
		# on OS X force tmux's default command
		# to spawn a shell in the user's namespace
		tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
		exec tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
	else
		exec tmux new-session && echo "tmux created new session"
	fi
}

function tmux_kill_session()
{
	REPLY=`{ echo "B: Back to session list"; tmux list-sessions; echo "K: Kill server" } | \
		~/.zinit/polaris/bin/fzf --reverse --ansi | \
		cut -d ":" -f 1`

	if [[ "$REPLY" == "K" ]]; then
		tmux kill-server || true
		tmux_create_session

	elif [[ "$REPLY" == "B" ]]; then
		tmux_automatically_attach_session

	elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
		tmux kill-session -t "$REPLY"
	fi
}

tmux_automatically_attach_session
