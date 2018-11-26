set Targets $GOPATH/src/github.com/ryomak

function devgo
  find $Targets -maxdepth 1 -type d -name  '.*' -prune -or -not -name '.*'   | peco --prompt "move ▶︎" | read dist
  cd $dist
end
