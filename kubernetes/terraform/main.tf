provider "yandex" {
  cloud_id                 = "var.yc_cloud_id"
  folder_id                = var.yc_folder_id
  zone                     = var.yc_region
  service_account_key_file = var.yc_service_account_key_file
}

#terraform {
#  required_providers {
#    yandex = {
#      source = "yandex-cloud/yandex",
#      version = "v0.109.0"
#    }
#  }
#  required_version = ">= 0.13"
#}


resource "yandex_vpc_address" "node_vpc" {
  count = var.node_instance_count
  name = "k8s-node-${count.index}"
  external_ipv4_address {
    zone_id = var.yc_region
  }
}

resource "yandex_vpc_address" "master_vpc" {
  name = "k8s-master"
  external_ipv4_address {
    zone_id = var.yc_region
  }
}

resource "yandex_compute_instance" "k8s-node" {
  count = var.node_instance_count
  name  = "k8s-node-${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8500b61gv8mj86b0ns"
      name     = "k8s-node-${count.index}-boot"
      size     = 40
    }
  }

  network_interface {
    nat_ip_address = yandex_vpc_address.node_vpc[count.index].external_ipv4_address[0].address
    subnet_id      = var.yc_subnet_id
    nat            = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

resource "yandex_compute_instance" "k8s-master" {
  name  = "k8s-master"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8500b61gv8mj86b0ns"
      name     = "k8s-master-boot"
      size     = 40
    }
  }

  network_interface {
    nat_ip_address = yandex_vpc_address.master_vpc.external_ipv4_address[0].address
    subnet_id      = var.yc_subnet_id
    nat            = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
