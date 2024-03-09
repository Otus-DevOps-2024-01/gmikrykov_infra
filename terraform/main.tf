provider "yandex" {
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
  zone                     = var.yc_region
  service_account_key_file = var.yc_service_account_key_file
}
# terraform {
#     backend "s3" {
#     endpoint = "https://storage.yandexcloud.net"
#     bucket = "backend-terraform-gmikryukov"
#     region = "ru-central1-a"
#     key    = "../../key.json"
#     access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#     secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key


#     skip_region_validation      = true
#     skip_credentials_validation = true
#     # skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
#     # skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

#   }
# }
module "app" {
  source          = "./modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  private_key_path= var.private_key_path
  subnet_id = var.subnet_id
  metadata_path   = var.metadata_path
}

module "db" {
  source          = "./modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id = var.subnet_id
  private_key_path= var.private_key_path
  metadata_path   = var.metadata_path
}

  # connection {
  #   type  = "ssh"
  #   host  = yandex_vpc_address.app_vpc[count.index].external_ipv4_address[0].address
  #   user  = "ubuntu"
  #   agent = false
  #   # путь до приватного ключа
  #   private_key = file(var.private_key_path)
  # }

  # provisioner "file" {
  #   source      = "files/puma.service"
  #   destination = "/tmp/puma.service"
  # }

  # provisioner "remote-exec" {
  #   script = "files/deploy.sh"
  # }
