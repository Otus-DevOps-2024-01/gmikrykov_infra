resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    serial-port-enable    = "1"
    # ssh-keys = "ubuntu:${file(var.public_key_path)}"
    user-data = "${file(var.metadata_path)}"
  }

  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface[0].nat_ip_address
    user  = "zombi"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "date",
    ]
  }

}
