#!/bin/sh
sleep 20

sudo add-apt-repository -y ppa:jblgf0/python && apt-get update && apt-get install -y python3.6 ruby-full ruby-bundler build-essential
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
