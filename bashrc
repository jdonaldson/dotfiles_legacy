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

# opam system bin
maybePath $HOME/.opam/system/bin

# personal venv
maybeSource $HOME/.virtualenvs/venv/bin/activate

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

alias munit="haxelib run munit"
alias mlib="haxelib run mlib"
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
   /usr/bin/ssh -t $@ "tmux attach || tmux new";
}

export HAXE_STD_PATH="/usr/local/lib/haxe/std"

# use git-prompt
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME="Custom"
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
    export GIT_PS1_SHOWDIRTYSTATE=
    export GIT_PS1_SHOWUNTRACKEDFILES=
fi

devhaxe(){
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
   luarocks install environ
   luarocks install luv
}

source ~/env/bin/activate
