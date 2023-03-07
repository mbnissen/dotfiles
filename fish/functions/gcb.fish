function gcb
  git checkout main
  git pull
  git checkout -b "$argv"
end
