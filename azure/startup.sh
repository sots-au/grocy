#!/bin/bash
set -e

# Make sure persistent storage exists
mkdir -p /home/site/grocy-data
if [ ! -L /home/site/wwwroot/data ]; then
  rm -rf /home/site/wwwroot/data || true
  ln -s /home/site/grocy-data /home/site/wwwroot/data
fi

# Apply custom nginx config
cp /home/site/default.conf /etc/nginx/sites-available/default
service nginx reload || true
