set Targets ~/develop

function dev
  find $Targets -maxdepth 2 -type d -name  '.*' -prune -or -not -name '.*'   | peco --prompt "move ▶︎" | read dist
  cd $dist
end
