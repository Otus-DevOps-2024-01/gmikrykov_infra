## Yandex Cloud

variable "public_key_path" {
  type        = string
  description = "Key Path"
}

variable "subnet_id" {
  type        = string
  description = "Yandex Cloud Subnet ID"
}

variable "private_key_path" {
  type        = string
  description = "Private Key Path"
}

variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
