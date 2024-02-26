#!/bin/sh

 yc compute instance create \
   --name reddit-full \
   --hostname reddit-full \
   --memory=4 \
   --create-boot-disk image-name="reddit-full",size=10GB \
   --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
   --metadata serial-port-enable=1 \
   --ssh-key ~/.ssh/id_rsa.pub
