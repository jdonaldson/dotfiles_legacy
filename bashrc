# auth/creds
if [ -f $HOME/.auth.sh ]; then
    source $HOME/.auth.sh
fi

# company specific config
if [ -f $HOME/.comrc.sh ]; then
    source $HOME/.comrc.sh
fi

# private config
if [ -f $HOME/.privaterc ]; then
   source $HOME/.privaterc
fi

export EMAIL="jdonaldson@gmail.com"
export EMAIL_OBSCURED="jdonaldson[at]gmail[dot]com"


# export HISTSIZE=100000
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1



# prefer usr/local
export PATH=/usr/local/share:/usr/local/bin:/usr/local/sbin:$PATH
unamestr=`uname`

# it is the future.  I always have 256 colors.
export TERM=xterm-256color

export PGDATA=/usr/local/var/postgres

if   [[ "$unamestr" == 'Linux'  ]]; then
    source ~/os/linux/bashrc
elif [[ "$unamestr" == 'Darwin' ]]; then
    source ~/os/darwin/bashrc
fi

alias serve="python -m SimpleHTTPServer 9040"

alias munit="haxelib run munit"
alias mlib="haxelib run mlib"


export PATH=$PATH:~/bin
export CVSEDITOR=vim
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim

alias ls='ls -G'
alias ll='ls -al'
alias ..='cd ..'
alias p4_untracked='find . -type f -print0 | xargs -0 p4 fstat >/dev/null'
alias cdp="cd -P"
alias ssh='ssh -X'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# add dotfile util bin directory
export PATH=~/.dotfiles/bin:$PATH

# hadoop
export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"

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


