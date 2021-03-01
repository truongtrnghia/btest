#!/bin/bash

if [ -z "$1" ]; then
  echo 'Usage: publish_amie [major|minor|patch]'
  exit 1
fi

npm whoami 2> /dev/null
if [ "$?" == "1" ]; then
  echo Login npm first
  npm login
else
  echo 'Logged in '
fi
lerna version $1
lerna publish from-git