# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
if which rbenv > /dev/null
  rbenv init - | source
end

# nodenv
if which nodenv > /dev/null
  nodenv init - | source
end

# k8s
set -g theme_display_k8s_context yes

# benri commands
set -x PATH $HOME/exec $PATH

# peco
bind \cr 'peco_select_history (commandline -b)'

# ghq
bind \cg 'peco_select_ghq (commandline -b)'

# checkout
bind \cb "git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads | peco | xargs git checkout"

# alias
alias cls='clear'

alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias d='docker'
alias dc='docker-compose'
alias dce='docker-compose exec -e COLUMNS=(tput cols) -e LINES=(tput lines)'

alias gcstart='gcloud compute instances start'
alias gcstop='gcloud compute instances stop'
alias gcssh='gcloud compute ssh'

alias be='bundle exec'

alias g='git'
alias t='tig'

alias k='kubectl'
