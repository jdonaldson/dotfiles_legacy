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
