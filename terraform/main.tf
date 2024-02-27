terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
  zone                     = var.yc_region
  service_account_key_file = var.yc_service_account_key_file
}

resource "yandex_vpc_address" "app_vpc" {
  count = var.reddit_instance_count

  name = "app-${count.index}"

  external_ipv4_address {
    zone_id = var.yc_region
  }
}

resource "yandex_compute_instance" "app" {
  count = var.reddit_instance_count
  name  = "reddit-app-${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8v7i965ok419rg23h2"
      name     = "reddit-${count.index}-boot"
      size     = 10
    }
  }

  network_interface {
    nat_ip_address = yandex_vpc_address.app_vpc[count.index].external_ipv4_address[0].address
    subnet_id      = var.yc_subnet_id
    nat            = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = yandex_vpc_address.app_vpc[count.index].external_ipv4_address[0].address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}
