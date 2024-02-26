#!/bin/sh
mkdir /srv/app
cd /srv/app
sudo apt-get install -y git && git clone -b monolith https://github.com/express42/reddit.git

cd reddit && bundle install
