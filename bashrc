# auth/creds
if [ -f $HOME/.auth ]; then
    source $HOME/.auth
fi

# bigml settings
if [ -f $HOME/.bigmlrc ]; then
    source $HOME/.bigmlrc
fi

export HISTSIZE=100000

# prefer usr/local
export PATH=$HOME/.local/bin:/usr/local/share:/usr/local/bin:/usr/local/sbin:$PATH

# work with haxe nightlies
#export HAXE_LIBRARY_PATH=$HOME/bin/haxe_nightly/std:.
#export PATH=$HOME/bin/haxe_nightly:$PATH

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source virtualenvwrapper_lazy.sh

# django
function setdsm() {
    export PYTHONPATH=$PYTHONPATH:$PWD/..
    export PYTHONPATH=$PYTHONPATH:$PWD
    if [ -z "$1" ]; then
        x=${PWD/\/[^\/]*\/}
        export DJANGO_SETTINGS_MODULE=$x.settings
    else
        export DJANGO_SETTINGS_MODULE=$1
    fi
    echo "DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE"
}

#ruby
export GEM_HOME=$HOME/.gems
export GEM_PATH=$HOME/.gems:/usr/lib/ruby/gems/1.8/
export PATH=$PATH:$HOME/.gems/bin

# hadoop
export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"

# node.js
export NODE_PATH="/usr/local/lib/node"
export NODE_PATH="/usr/local/lib/node_modules":$NODE_PATH # node modules
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH # jsctags
export PKG_CONFIG_PATH # ?

# java
export JAVA_OPTS=-Xmx2500m

# aws/ec2 specific tools
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-62308/jars"

# git utilities
function parse_git_dirty {
   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="\[\e[01;32m\]\h \[\e[01;34m\]\W \$(parse_git_branch)\[\e[01;34m\]$\[\e[00m\] "
