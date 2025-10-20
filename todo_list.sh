all_my_repos=("$(curl -s "https://github.com/jgolden5?tab=repositories" | grep 'itemprop="name codeRepository"' | sed 's/.*jgolden5\/\(.*\)" i.*/\1/')")
#echo "${all_my_repos[@]}" #<- may be used for testing
rm all_todos 2>/dev/null
echo "Todos..."
for repo in ${all_my_repos[@]}; do
  echo
  echo "${repo}:" | tee -a all_todos
  curl -s https://github.com/jgolden5/$repo/blob/main/todo | grep "rawLines" | sed 's/.*"rawLines":\[\(.*\)\],"stylingD.*/\1/' | sed 's/^"//g' | sed 's/","/\n/g' | sed 's/"$//' | tee -a all_todos
  echo >> all_todos
done
