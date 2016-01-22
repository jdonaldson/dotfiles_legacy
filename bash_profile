source ~/.bashrc

# only default to tmux if I'm not in an ssh session
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
    [[ -z $TMUX ]] && tmux
fi

# OPAM configuration
test -f $HOME/.opam/opam-init.sh && . /Users/$USER/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
