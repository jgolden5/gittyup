#!/bin/bash
if [[ $1 ]]; then
  parent_dir="$1"
else
  parent_dir=$(pwd | sed 's/.*\/\(.*\)/\1/')
fi
curl -s "https://api.github.com/repos/jgolden5/$parent_dir" | grep -q 'visibility'
if [[ $? == 0 ]]; then
  echo "$parent_dir: public"
else
  echo "$parent_dir: private, non-remote, or non-existent"
fi
