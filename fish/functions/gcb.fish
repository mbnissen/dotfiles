function gcb
  git checkout master
  git pull
  git checkout -b "$argv"
end
