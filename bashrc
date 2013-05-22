# auth/creds
if [ -f $HOME/.auth ]; then
    source $HOME/.auth
fi

# com specific config
if [ -f $HOME/.comrc ]; then
    source $HOME/.comrc
fi


#export TMUX_POWERLINE_DEBUG_MODE_ENABLED=true
# export HISTSIZE=100000

# prefer usr/local
export PATH=$HOME/.local/bin:/usr/local/share:/usr/local/bin:/usr/local/sbin:$PATH

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    export TERM=xterm-256color
    alias ack="ack-grep"
elif [[ "$unamestr" == 'Darwin' ]]; then
    alias vim="mvim -v"

    # export MACOSX_DEPLOYMENT_TARGET=10.8
    if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    fi

    # z
    if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
    . `brew --prefix`/etc/profile.d/z.sh
    fi
    # aws/ec2 specific tools
    # export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
    export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-62308/jars"
fi

alias serve="python -m SimpleHTTPServer 9040"
alias gimme="sudo apt-get install"
alias isthere="apt-cache search"

alias munit="haxelib run munit"
alias mlib="haxelib run mlib"

source $HOME/.privaterc

# virtualenv
export PATH=$HOME/.venv_bootstrap/bin:$PATH
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

# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=$PATH:~/bin
export CVSEDITOR=vim
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim


alias ls='ls -G'
alias ll='ls -al'
alias ..='cd ..'




[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export HAXE_LIBRARY_PATH=/usr/lib/haxe/std:.

export OLDPATH=$PATH
export HAXE_NIGHTLY=$HOME/bin/haxe_nightly
hxn(){
    if  [ -z "$USE_HAXE_NIGHTLY" ] || $USE_HAXE_NIGHTLY; then
        echo "Changing to Haxe stable version"
        export HAXE_STD_PATH=$OLD_HAXE_STD
        export PATH=$OLDPATH
        export USE_HAXE_NIGHTLY=false
    else
        echo "Changing to Haxe nightly at: $HAXE_NIGHTLY"
        export OLD_HAXE_STD=$HAXE_STD_PATH
        export HAXE_STD_PATH=$HAXE_NIGHTLY/haxe/std:.
        export OLDPATH=$PATH
        export PATH=$HAXE_NIGHTLY/haxe:$PATH
        export USE_HAXE_NIGHTLY=true
    fi
}
# android
#export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
#export ANDROID_HOME=`brew --prefix android`

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


# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

# append to history
shopt -s histappend

function _update_ps1()
{
   export PS1="$(~/bin/powerline-shell/powerline-shell.py $?)"
   history -a
}
export PROMPT_COMMAND="_update_ps1"

# old tmux powerline
# PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# new powerline
# . /Users/jjd/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

