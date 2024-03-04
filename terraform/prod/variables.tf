## Yandex Cloud
variable "yc_service_account_key_file" {
  type        = string
  description = "Contains either a path to or the contents of the Service Account file in JSON format"
}

variable "yc_region" {
  type        = string
  description = "Yandex Cloud Region (i.e. ru-central1-c)"
  default     = "ru-central1-a"
}

variable "yc_provider" {
  type        = string
  description = "Yandex Cloud provider"
  default     = "yandex-cloud/yandex"
}

variable "yc_cloud_id" {
  type        = string
  description = "Yandex Cloud id"
}

variable "yc_folder_id" {
  type        = string
  description = "Yandex Cloud folder id"
}

variable "public_key_path" {
  type        = string
  description = "Key Path"
}

variable "private_key_path" {
  type        = string
  description = "Private Key Path"
}

variable "subnet_id" {
  type        = string
  description = "Yandex Cloud Subnet ID"
}

variable "reddit_instance_count" {
  type = number
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
