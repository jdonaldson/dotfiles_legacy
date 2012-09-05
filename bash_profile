source ~/.bashrc
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
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


# git utilities
function parse_git_dirty {
   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="\[\e[01;32m\]\h \[\e[01;34m\]\W \$(parse_git_branch)\[\e[01;34m\]$\[\e[00m\] "
