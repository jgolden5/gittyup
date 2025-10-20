all_my_repos=("$(curl -s "https://github.com/jgolden5?tab=repositories" | grep 'itemprop="name codeRepository"' | sed 's/.*jgolden5\/\(.*\)" i.*/\1/')")
#echo "${all_my_repos[@]}" #<- may be used for testing
read -n1 -p "Ready for a list of todos from each github project I care about? " confirmation
echo
if [[ $confirmation == 'y' ]]; then
  echo "Great! You're about to :)"
elif [[ $confirmation == 'n' ]]; then
  echo "Too bad! You're about to get it anyways ;)"
fi
for repo in ${all_my_repos[@]}; do
  echo
  echo "${repo} todos:"
  curl -s https://github.com/jgolden5/$repo/blob/main/todo | grep "rawLines" | sed 's/.*"rawLines":\[\(.*\)\],"stylingD.*/\1/' | sed 's/,/\n/g' | sed 's/"//g'
done
