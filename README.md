 # gmikrykov_infra

 bastion_IP = 84.201.158.140
 someinternalhost_IP = 10.128.0.29

 Способ подключения к серверу внутри локальный сети используя так называемый Jump-server - "ssh -J 84.201.158.140 10.128.0.29"
 Дополнительное задание:

 Чтобы подключиться к серверу за jump сервером используя короткую команду нужно создать alias в файле ~/.ssh/config такого содержания:

 Host someinternalhost
   HostName 10.128.0.29
   ForwardAgent yes
   ProxyCommand ssh -J bastion 10.128.0.29 nc %h %p

 Host bastion
   HostName 84.201.158.140
   ForwardAgent yes
   ProxyCommand ssh 84.201.158.140 nc %h %p

 После этого к someinternalhost можно будет подключаться командой ssh someinternalhost

 Задание со звездочкой SSL Letsencrypt выполнил, правда я взял не публичный ДНС а свой приватный так как xip.io  не работает. https://ptun.gm73.ru/
