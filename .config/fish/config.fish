# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
if which rbenv > /dev/null
  rbenv init - | source
end

# vi keybind
function fish_user_key_bindings
  for mode in insert default visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase
end

# peco
bind \cr 'peco_select_history (commandline -b)'

# alias
alias cls='clear'

alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias dc='docker-compose'

alias gcstart='gcloud compute instances start'
alias gcstop='gcloud compute instances stop'
alias gcssh='gcloud compute ssh'

alias be='bundle exec'
