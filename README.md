 # gmikrykov_infra
 Ansible: Используется динамический инвентори и разные плейбуки
 - ansible-playbook -i inventory.sh  reddit_app2.yml

 Packer:
- добавлена поддержка Ansible provisioners

    "provisioners": [
      {
        "type": "ansible",
        "playbook_file": "ansible/packer_app.yml"
      }
    ]
