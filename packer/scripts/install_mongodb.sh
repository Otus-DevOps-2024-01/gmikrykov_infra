#!/bin/sh
sleep 20
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update && apt-get install -y mongodb-org
systemctl start mongod && systemctl enable mongod
# sudo add-apt-repository -y ppa:jblgf0/python && apt-get update && apt-get install -y python3.6
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
