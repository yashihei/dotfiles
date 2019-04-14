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
