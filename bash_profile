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

# work with haxe nightlies
#export HAXE_LIBRARY_PATH=$HOME/bin/haxe_nightly/std:.
# export HAXE_LIBRARY_PATH=/Users/jjd/bin/haxe_nightly/haxe/std:.
# export PATH=$HOME/bin/haxe_nightly/haxe:$PATH
