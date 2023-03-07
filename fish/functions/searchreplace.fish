function searchreplace
  find . -name "*.$argv[1]" -print0 | xargs -0 sed -i "" "s|$argv[2]|$argv[3]|g"
end
