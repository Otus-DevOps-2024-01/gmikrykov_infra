#!/bin/sh

server_app=$(cd ../terraform/stage; terraform output | grep app | awk  '{print $3}')
server_db=$(cd ../terraform/stage; terraform output | grep db | awk  '{print $3}')


cat << EOF
{
  "all": {
    "hosts": [
      "app",
      "db"
    ]
  },
  "_meta": {
    "hostvars": {
      "app": {
        "ansible_host": "$server_app"
      },
      "db": {
        "ansible_host": "$server_db"
      }
    }
  }
}
EOF
