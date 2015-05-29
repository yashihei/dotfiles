#general
export LANG=ja_JP.utf8
umask 022

#alias
alias vi=vim
alias ls='ls -F --color=auto'
alias ll='ls -al'
alias la='ls -a'
alias g++='g++ -std=c++11 -Wall'
alias gcc='gcc -Wall'
alias grep='grep --color'
alias cp='cp -i'
alias mv='mv -i'

export PS1='\[\e[1;33m\][\u@\h \W]\$\[\e[m\] '
. ~/.nvm/nvm.sh

