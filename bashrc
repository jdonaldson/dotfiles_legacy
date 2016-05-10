maybeSource(){ 
   test -f $1 && source $1 
}
maybePath(){ 
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

# testing
# test -d  $HOME/Projects/haxe/std && export HAXE_STD_PATH=$HOME/Projects/haxe/std

export PATH=~/bin:$PATH
# add custom flex sdk path
export PATH=$PATH:~/flex_sdk/bin
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

export HAXE_STD_PATH="/usr/local/lib/haxe/std"

# personal python venv
test -d $HOME/.virtualenvs/venv && source $HOME/.virtualenvs/venv/bin/activate

# use git-prompt
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
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
