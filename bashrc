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

maybeSource /usr/local/etc/bash_completion

# Append to path
# common latex location
maybePath /usr/texbin

maybePath ~/.local/bin

# maybeSource ~/Projects/com/blt/env.sh

# export NEKOPATH="$HOME/local/lib/neko/":"$HOME/local/bin/"


export EMAIL="jdonaldson@gmail.com"
export EMAIL_OBSCURED="jdonaldson[at]gmail[dot]com"

# Git options
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_EDITOR=nvim

# prefer usr/local
export PATH=/usr/local/share:/usr/local/bin:/usr/local/sbin:$PATH



export PGDATA=/usr/local/var/postgres

unamestr=`uname`
if   [[ "$unamestr" == 'Linux'  ]]; then
    source ~/.os/linux/bashrc
    export PATH=~/.os/linux/bin:$PATH
elif [[ "$unamestr" == 'Darwin' ]]; then
    source ~/.os/darwin/bashrc
    export PATH=~/.os/darwin/bin:$PATH
fi

alias serve="python -m http.server"
# alias travix="haxelib run travix"

alias untar="tar xvzf"

alias arec="asciinema rec"
alias aplay="asciinema play"


export PATH=~/bin:$PATH

# add custom flex sdk path
# maybePath ~/flex_sdk/bin

export CVSEDITOR=vim
export EDITOR=vim
export SVN_EDITOR=vim

alias ls='ls -G'
alias ll='ls -alG'
alias ..='cd ..'
alias p4_untracked='find . -type f -print0 | xargs -0 p4 fstat >/dev/null'
alias cdp="cd -P"
alias ssh='ssh -X'
alias untar='tar xvjf'
alias vim='nvim'

# radio
alias radio_limbik="mplayer -playlist http://yp.shoutcast.com/sbin/tunein-station.pls?id=249295" # Limbik frequencies
alias radio_npr="mplayer -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls" # MPR News
alias radio_kexp="mplayer http://kexp-mp3-128.streamguys1.com/kexp128.mp3"

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

maybeSource ~/hererocks/bin/activate
maybePathAppend /usr/local/openresty/bin

# personal venv
maybeSource $HOME/venv/bin/activate

maybePath /usr/local/opt/go/libexec/bin

maybeSource .fzf.bash

maybeSource $HOME/.cargo/env
export OCAMLPARAM="safe-string=0,_"

alias syncintent="rsync -a dljjd:Projects/deep_intent ~/Projects/"

eval "$(rbenv init -)" 2>/dev/null

export AIRFLOW_HOME=~/airflow
export GPG_TTY=$(tty)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

maybeSource /Users/jdonaldson/Library/Preferences/org.dystroy.broot/launcher/bash/br
# maybePath /Users/jdonaldson/Projects/haxe


maybePath /usr/local/opt/ruby/bin
maybePath "/usr/local/Cellar/ruby/1.9.3-p194/bin"

# maybeSource ~/env/bin/activate
# maybePath ~/Projects/kleiner_dev/bin


source /Users/jdonaldson/.bootstrap_rc
export FORCE_SESSION_ID="00DRM0000005pwz!AQIAQDeQ4hgDGeG4lvr1npqIzyeRo_4Ni8mk52H2YkWMvzeuolVeLOoLKykTuxkaany8c6uzcK.VR6LwcN0u.r9f_ZBuK6IT"
