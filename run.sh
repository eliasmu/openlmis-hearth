#!/bin/sh

if [ -d "/consul" ]; then
    node consul/registration.js -c register -f /consul/config.json 
else
  echo 'No consule found'
fi
cd /src/hearth/

yarn start