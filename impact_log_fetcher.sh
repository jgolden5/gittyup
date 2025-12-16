#!/bin/bash

all_my_repos=("$(curl -s "https://github.com/jgolden5?tab=repositories" | grep 'itemprop="name codeRepository"' | sed 's/.*jgolden5\/\(.*\)" i.*/\1/')")
#echo "${all_my_repos[@]}" #<- may be used for testing
rm all_impact_logs 2>/dev/null
echo "impact.log files..."
for repo in ${all_my_repos[@]}; do
  echo
  echo "${repo}:" | tee -a all_impact_logs
  curl -s https://github.com/jgolden5/$repo/blob/main/impact.log | grep "rawLines" | sed 's/.*"rawLines":\[\(.*\)\],"stylingD.*/\1/' | sed 's/^"//g' | sed 's/","/\n/g' | sed 's/"$//' | tee -a all_impact_logs
  echo >> all_impact_logs
done
