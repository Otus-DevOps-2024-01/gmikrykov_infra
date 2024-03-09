resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  labels = {
    tags = "reddit-db"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    serial-port-enable    = "1"
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  connection {
    type  = "ssh"
    host  = yandex_compute_instance.db.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo add-apt-repository -y ppa:jblgf0/python",
      "sudo apt-get update",
      "sudo apt-get install -y python3.6 ",
      "sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2",
    ]
  }
}
