# bash completion!
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi


export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias ls='ls -G'
alias ll='ls -al'
alias ..='cd ..'


# personal scripts
export PATH=$HOME/bin/datatools:$HOME/bin:/usr/local/haxe/bin:$PATH

# prefer usr/local
export PATH=/usr/local/bin:$PATH

#git branch in prompt
PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    local STTYOPTS="$(stty -g)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
export NODE_PATH="/usr/local/lib/node"
export PKG_CONFIG_PATH
export LSCOLORS="gxfxcxdxbxegedabagacad"
export CVSEDITOR=emacs
export EDITOR=emacs
export JAVA_OPTS=-Xmx2500m
export SVN_EDITOR=emacs
export GIT_EDITOR=emacs
# ML=~/Projects/BigML/

# haxe specific path/env mods

export HAXE_LIBRARY_PATH=/usr/lib/haxe/std:. # the ':.' part is important
export HAXE_HOME=/usr/lib/haxe
PATH=$PATH:$HAXE_LIBRARY_PATH:$HAXE_HOME/bin

#prefer local path
PATH=/usr/local/bin:$PATH

#AWS/EC2 specific tools
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-62308/jars"

# rvm for managing ruby
# if [[ -s /Users/jjdonald/.rvm/scripts/rvm ]] ; then source /Users/jjdonald/.rvm/scripts/rvm ; fi

# site testing:
export SKY_TEST_URL="localhost:1025"
export SKY_TEST_USERNAME='ciskoo'
export SKY_TEST_PASSWORD='cisko'

