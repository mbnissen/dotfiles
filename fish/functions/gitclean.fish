function gitclean
git branch | grep -v "main" | xargs git branch -D
git stash clear
end
