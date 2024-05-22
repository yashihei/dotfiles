function peco_select_ghq
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  ghq list | peco $peco_flags | read foo

  if [ $foo ]
    cd (ghq root)/$foo
    commandline -f repaint
  end
end

