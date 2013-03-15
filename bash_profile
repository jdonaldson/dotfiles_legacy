source ~/.bashrc
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=$PATH:~/bin
export CVSEDITOR=vim
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi


alias ls='ls -G'
alias ll='ls -al'
alias ..='cd ..'

# z
if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
   . `brew --prefix`/etc/profile.d/z.sh
fi



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export HXSTABLE=true
export HAXE_LIBRARY_PATH=/usr/lib/haxe/std:.
export OLDPATH=$PATH

hxn(){
    if  $HXSTABLE; then
        echo "Changing to Haxe nightlies"
        export HAXE_LIBRARY_PATH=/Users/jjd/bin/haxe_nightly/haxe/std:.
        export OLDPATH=$PATH
        export PATH=$HOME/bin/haxe_nightly/haxe:$PATH
        export HXSTABLE=false
    else
        echo "Changing to Haxe stable version"
        export HAXE_LIBRARY_PATH=/usr/lib/haxe/std:.
        export PATH=$OLDPATH
        export HXSTABLE=true
    fi

}
# work with haxe nightlies
#export HAXE_LIBRARY_PATH=$HOME/bin/haxe_nightly/std:.
