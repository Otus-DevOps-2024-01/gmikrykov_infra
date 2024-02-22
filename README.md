 # gmikrykov_infra
 testapp_IP = 51.250.94.146
 testapp_port = 9292

 bastion_IP = 84.201.158.140
 someinternalhost_IP = 10.128.0.29

 Комманда установки compute instance с последующей установкой приложений:

 yc compute instance create \
   --name reddit-app \
   --hostname reddit-app \
   --memory=4 \
   --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
   --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
   --metadata serial-port-enable=1 \
   --metadata-from-file user-data=startup.yml
