 # gmikrykov_infra
 Packer: для запуска сборки образов используем:
  - packer build -var-file ./variables.json ./app.json
  - packer build -var-file ./variables.json ./db.json

  Tefrrraform: меняем ИД образов дисков созданных в Packer в файле terraform.tfvars
   - cd terraform/stage/
   - terraform plan
   - terraform apply

  Ansible: запуск
   - ansible-playbook -i inventory.sh clone.yml - плейбук с использованием динамического Inventory которвый берет ИП адреса из terraform output
   - ansible-playbook -i inventory.json clone.yml - Использование формата Json
   - ansible-playbook -i inventory.yml clone.yml  - Использование формата YAML
   - ansible-playbook -i inventory.ini clone.yml  - Использование формата ini
