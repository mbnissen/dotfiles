function gcbs
  git stash --include-untracked
  git checkout main
  git pull
  git checkout -b "$argv"
  git stash apply
end
