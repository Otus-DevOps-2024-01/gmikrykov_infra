 # gmikrykov_infra
 testapp_IP = 51.250.94.146
 testapp_port = 9292

 bastion_IP = 84.201.158.140
 someinternalhost_IP = 10.128.0.29

 Команда запуска packer для создания образа:
  - packer  build -var-file ./variables.json ./ubuntu16.json

 Команда запуска packer для создания полного образа с приложением:
  - packer  build -var-file ./variables.json ./immutable.json

 Запуск ВМ с помощью подготовленного образа:
  - ./config-scripts/create-reddit-vm.sh
