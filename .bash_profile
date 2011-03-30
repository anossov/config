# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# the rest of this file is commented out.

# set PATH so it includes user's private bin if it exists
#if [ -d ~/bin ] ; then
#    PATH=~/bin:"${PATH}"
#fi

# do the same with MANPATH
#if [ -d ~/man ]; then
#    MANPATH=~/man${MANPATH:-:}
#    export MANPATH
#fi
export LANG=en_US.UTF-8

GRAY="\\[\\e[38;05;240m\\]"
RED="\\[\\e[01;31m\\]"
BLUE="\\[\\e[01;34m\\]"
STOP="\\[\\e[00m\\]"
export PS1="$GRAY\$(date +%k:%M:%S) $RED\\h $BLUE\\W \\\$ $STOP"

export DEBEMAIL="Pavel Anossov <anossov@yandex-team.ru>"

alias dchi="dch -iU -D unstable --force-distribution"
alias grep="grep --color"
alias v="vim"
alias vbp="vim ~/.bash_profile"
alias vrc="vim ~/.vimrc"
alias ll="ls -hog"
alias bdi="bzr di | colordiff"
alias less="less -R"


function get() {
    printf "\033]0;__pw:"`pwd`"\007" ;
    for file in $* ;
        do printf "\033]0;__rv:"${file}"\007" ;
    done ; 
    printf "\033]0;__ti\007" ;
}


export HISTTIMEFORMAT="%F %T "
export HISTFILESIZE=5000
export HISTIGNORE="pwd:debuild:history*:bzr di:bzr st:debcommit -rR:debrelease:cd ~:cd ~/:cd -:man *:bzr ci:bzr up:bzr pull:bzr push:reset:fg:bg:dchi:dch"

shopt -s histappend
PROMPT_COMMAND="$PROMPT_COMMAND;history -a"
