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

variable "yc_subnet_id" {
  type        = string
  description = "Yandex Cloud Subnet ID"
}

variable "reddit_instance_count" {
  type = number
}
