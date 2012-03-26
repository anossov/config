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
BLUE="\\[\\e[38;05;26m\\]"
STOP="\\[\\e[00m\\]"
if [ ! ${HOSTCOLOR} ]; then
    HOSTCOLOR=$RED
fi
export PS1="$GRAY\$(date +%k:%M:%S) $HOSTCOLOR\\h $BLUE\\W \\\$ $STOP"

export DEBEMAIL="Pavel Anossov <anossov@yandex-team.ru>"

alias dchi="dch -iU -D unstable --force-distribution"
alias grep="grep --color"
alias v="vim"
alias vbp="vim ~/.bash_profile"
alias vrc="vim ~/.vimrc"
alias ll="ls -hog"
alias bdi="bzr di | colordiff"
alias less="less -R"
alias ..="cd .."
alias r='redis-cli'
alias rkeys=' r keys \* | sed -e '\''s/:[0-9]\+:/::/g'\'' | sort | uniq -c'

alias b='debuild && debclean'
alias i='debuild && debclean && sudo debi'
alias release='debcommit -rR && debrelease --nomail'

alias A='source bin/activate'
alias D='deactivate'

function get() {
    printf "\033]0;__pw:"`pwd`"\007" ;
    for file in $* ;
        do printf "\033]0;__rv:"${file}"\007" ;
    done ; 
    printf "\033]0;__ti\007" ;
}


export HISTTIMEFORMAT="%F %T "
export HISTFILESIZE=5000
export HISTIGNORE="pwd:debuild:history*:debrelease:man *:reset:fg:bg:dchi:dch"

shopt -s histappend

if [ -n "${PROMPT_COMMAND}" ]
then
    PROMPT_COMMAND="${PROMPT_COMMAND};"
fi
PROMPT_COMMAND="${PROMPT_COMMAND}history -a;"
PROMPT_COMMAND=${PROMPT_COMMAND}'echo -ne "\033]0;${HOSTNAME%%.*}:${PWD##*/}\007"'










# COLOR MAN

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
