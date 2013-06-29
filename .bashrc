export LANG=ja_JP.utf8
WINHOME=/cygdrive/c/Users/Ryu
#umask 022

#aliasとか
alias vi=vim
alias ls='ls -aF --color=auto'
alias ll='ls -l'
alias g++='g++-3 -Wall'
alias grep='grep --color'
alias cp='cp -i'
alias mv='mv -i'

#PS1
#PS1="\u@\h \W$ "
#PS1="\u@\h \W$ (__git_ps1 " (%s)")"

#タイトルをVIMを使ってくれてありがとうにしない
#PS1=\[\e]0;\w\a\]
#PS1+=
export PS1='\[\e]0;\w\a\]\u@\h \w$(__git_ps1 " (%s)")\$ '

