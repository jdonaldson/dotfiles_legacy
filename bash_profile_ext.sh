maybeSource(){
   test -f $1 && . $1
}

maybePath(){
   test -d $1 && export PATH=$1:$PATH
}
maybePathAppend(){
   test -d $1 && export PATH=$PATH:$1
}

# only default to tmux if I'm not in an ssh session
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
    [[ -z $TMUX ]] && tmux new-session -A -s main
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

maybePath "${HOME}/.cargo/bin"

# OPAM configuration
. "${HOME}/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
eval `opam config env`

