# auth/creds
if [ -f $HOME/.auth ]; then
    source $HOME/.auth
fi

# bigml settings
if [ -f $HOME/.bigmlrc ]; then
    source $HOME/.bigmlrc
fi

export MACOSX_DEPLOYMENT_TARGET=10.8

#export TMUX_POWERLINE_DEBUG_MODE_ENABLED=true
export HISTSIZE=100000

# prefer usr/local
export PATH=$HOME/.local/bin:/usr/local/share:/usr/local/bin:/usr/local/sbin:$PATH

alias vim="mvim -v"

alias munit="haxelib run munit"
alias mlib="haxelib run mlib"

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

# android
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=`brew --prefix android`

#ruby
#export GEM_HOME=$HOME/.gems
#export GEM_PATH=$HOME/.gems:/usr/lib/ruby/gems/1.8/
#export PATH=$PATH:$HOME/.gems/bin
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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

# aws/ec2 specific tools
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-62308/jars"

# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

function _update_ps1()
{
   export PS1="$(~/lib/powerline-bash/powerline-bash.py $?)"
}
export PROMPT_COMMAND="_update_ps1"

# old tmux powerline
# PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# new powerline
# . /Users/jjd/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

