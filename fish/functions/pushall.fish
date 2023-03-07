function pushall --description 'git add, commit, and push in one'
  git add .
  git commit -m "$argv"
  git push -u origin HEAD
end
