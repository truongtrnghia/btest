#!/bin/bash
registry="http://localhost:4873"
if [ -z "$1" ]; then
  echo 'Usage: publish_amie [major|minor|patch]'
  echo 'Must have at least one commit from the last publish'
  exit 1
fi
lerna -h 2>&1 > /dev/null
if [ "$?" != "0" ]; then
  echo 'Install lerna by: npm i -g lerna'
fi
npm whoami --registry "$registry" 2> /dev/null
if [ "$?" != "0" ]; then
  echo 'Login npm first'
  npm login --registry "$registry"
else
  echo 'Logged in '
fi
lerna version $1
lerna publish from-git --registry "$registry"
echo1