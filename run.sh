#!/bin/sh

if [ -d "/consul" ]; then
    node consul/registration.js -c register -f /consul/config.json 
else
  echo 'No consule found'
fi
cd /src/hearth/
sed -i.bak 's@localhost@'"$VIRTUAL_HOST"'@' /src/hearth/config/default.json

yarn start