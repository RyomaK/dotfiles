function git_status
  set -l s (git status --porcelain --branch 2> /dev/null | sed -e '/^#/d')
  echo $s
end
