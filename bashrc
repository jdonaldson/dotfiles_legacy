maybeSource(){
   test -f $1 && . $1
}

maybePath(){
   test -d $1 && export PATH=$1:$PATH
}
maybePathAppend(){
   test -d $1 && export PATH=$PATH:$1
}

# company specific stuff
maybeSource $HOME/.comrc.sh

# auth/creds
maybeSource $HOME/.auth.sh

# personal private config
maybeSource $HOME/.privaterc

# Append to path
# common latex location
maybePath /usr/texbin

export EMAIL="jdonaldson@gmail.com"
export EMAIL_OBSCURED="jdonaldson[at]gmail[dot]com"

# Git options
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_EDITOR=vim

# prefer usr/local
export PATH=/usr/local/share:/usr/local/bin:/usr/local/sbin:$PATH
unamestr=`uname`



export PGDATA=/usr/local/var/postgres

if   [[ "$unamestr" == 'Linux'  ]]; then
    source ~/.os/linux/bashrc
    export PATH=~/.os/linux/bin:$PATH
elif [[ "$unamestr" == 'Darwin' ]]; then
    source ~/.os/darwin/bashrc
    export PATH=~/.os/darwin/bin:$PATH
fi

alias serve="python -m SimpleHTTPServer 9040"

alias untar="tar xvzf"

export PATH=~/bin:$PATH

# add custom flex sdk path
# maybePath ~/flex_sdk/bin

export CVSEDITOR=vim
export EDITOR=vim
export SVN_EDITOR=vim

alias ls='ls -G'
alias ll='ls -al'
alias ..='cd ..'
alias p4_untracked='find . -type f -print0 | xargs -0 p4 fstat >/dev/null'
alias cdp="cd -P"
alias ssh='ssh -X'
alias untar='tar xvjf'

# radio
alias limbik="mplayer -playlist http://yp.shoutcast.com/sbin/tunein-station.pls?id=249295" # Limbik frequencies
alias npr="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls" # MPR News

# git aliases
alias gitactive="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"

test -s "$HOME/.rvm/scripts/rvm" && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# add dotfile util bin directory
export PATH=~/.dotfiles/bin:$PATH

# hadoop
export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
export HADOOP_CONF_DIR=~/.hadoop

# node.js
export NODE_PATH="/usr/local/lib/node"
export NODE_PATH="/usr/local/lib/node_modules":$NODE_PATH # node modules
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH # jsctags
export PATH=/usr/local/share/npm/bin:$PATH # npm
export PKG_CONFIG_PATH # ?

# java
export JAVA_OPTS=-Xmx2500m

# append to history
shopt -s histappend

#openresty
export PATH=/usr/local/openresty/nginx/sbin:$PATH

#tmux
settitle() {
   printf "\033k$1\033\\"
}
takeover() {
    # create a temporary session that displays the "how to go back" message
    tmp='takeover temp session'
    if ! tmux has-session -t "$tmp"; then
        tmux new-session -d -s "$tmp"
        tmux set-option -t "$tmp" set-remain-on-exit on
        tmux new-window -kt "$tmp":0 \
            'echo "Use Prefix + L (i.e. ^B L) to return to session."'
    fi

    # switch any clients attached to the target session to the temp session
    session="$1"
    for client in $(tmux list-clients -t "$session" | cut -f 1 -d :); do
        tmux switch-client -c "$client" -t "$tmp"
    done

    # attach to the target session
    tmux attach -t "$session"
}

function ssht () {
   tmux set-option prefix2 C-b
   tmux setenv TMUX_B 1
   tmux source-file ~/.tmux.conf
   /usr/bin/ssh -t $@ "tmux attach || tmux new"
   tmux set-option prefix2 C-a
   tmux setenv -u TMUX_B
   tmux source-file ~/.tmux.conf
}

# use git-prompt
 if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  fi

# git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

devhaxe(){
   export FD_OUTPUT=1
   export STABLE_HAXE_PATH=$PATH;
   export STABLE_HAXE_STD_PATH=$HAXE_STD_PATH;
   export HAXE_STD_PATH=$HOME/Projects/haxe/std
   export PATH=$HOME/Projects/haxe:$PATH
}
stablehaxe(){
   export PATH=$STABLE_HAXE_PATH;
   export HAXE_STD_PATH=$STABLE_HAXE_STD_PATH;
}

function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# source torch if I have it
# maybeSource $HOME/torch/install/bin/torch-activate

maybeSource ~/.bash-git-prompt/gitprompt.sh
devhaxe

luadeps(){
   luarocks install lrexlib-pcre
   luarocks install environ
   luarocks install luasocket
   luarocks install luv
   luarocks install luabitop
}

maybeSource ~/env/bin/activate
maybePathAppend /usr/local/openresty/bin

# personal venv
maybeSource $HOME/.virtualenvs/venv/bin/activate

maybePath /usr/local/opt/go/libexec/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

maybeSource $HOME/.cargo/env
export OCAMLPARAM="safe-string=0,_"
