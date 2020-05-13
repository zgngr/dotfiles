#!/bin/sh

if [ -z "$GITHUB_TOKEN" ]; then
  echo "GITHUB_TOKEN environment variable is not specified"
  exit 1
fi

GITHUB=https://api.github.com/user/repos?per_page=100

for i in `curl -s -H "Authorization: token ${GITHUB_TOKEN}" ${GITHUB} | grep ssh_url | cut -d ':' -f 2-3|tr -d '",'`; 
do 
  git clone $i; 
done