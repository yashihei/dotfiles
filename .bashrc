export LANG=ja_JP.utf8
WINHOME=/cygdrive/c/Users/Ryu
umask 022

#aliasとか
alias vi=vim
alias ls='ls -aF --color=auto'
alias ll='ls -l'
alias g++='g++-3 -Wall'
alias gcc='gcc-3'
alias grep='grep --color'
alias cp='cp -i'
alias mv='mv -i'


#タイトルをVIMを使ってくれてありがとうにしない
#PS1=\[\e]0;\w\a\]
#しんぷる
#PS1="\u@\h \W$ "
#ブランチ名を表示すると重くなるひぎい
#export PS1='\[\e]0;\w\a\]\u@\h \W$(__git_ps1 " (%s)")\$ '

export PS1='\[\e]0;\w\a\]\u@\h \W\$ '

