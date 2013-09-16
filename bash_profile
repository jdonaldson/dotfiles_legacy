source ~/.bashrc

# only default to tmux if I'm not in an ssh session
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
    [[ -z $TMUX ]] && tmux
fi
