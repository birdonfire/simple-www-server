#!/bin/bash

# Fail quickly if something doesn't work
set -e

# This will be the actual nginx config file
CONF_FILE_CONTENTS="server {
    listen       80;
    root /var/www/;
    location / {
        sendfile off;
    }
}

"

if [ ! -e $HOME/.vagrant_first_provision.lock ]
then
    echo ">>> RUNNING FIRST PROVISIONING"

    # Install requisite OS-level packages
    apt-get update
    apt-get install -y nginx

    # Remember that we ran all this stuff
    touch $HOME/.vagrant_first_provision.lock
fi

# Create the nginx config
echo "$CONF_FILE_CONTENTS" > /etc/nginx/sites-available/default
service nginx restart
