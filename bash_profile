source ~/.bashrc

# only default to tmux if I'm not in an ssh session
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
    [[ -z $TMUX ]] && tmux new-session -A -s main
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export PATH="$HOME/.cargo/bin:$PATH"

# OPAM configuration
. /Users/jjd/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
