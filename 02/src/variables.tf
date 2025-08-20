### cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "service_account_key_file" {
  type        = string
  description = "Путь к JSON-ключу сервисного аккаунта"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "CIDR for ru-central1-b subnet"
}

### image

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образов для data.yandex_compute_image"
}

### ssh vars

variable "vms_ssh_public_root_key" {
  type        = string
  description = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJpYbwJI0AnKlZhwxWipXErfFk1LDxmXMpMIgoscd4r2 webinar"
}

# Конфигурация ресурсов ВМ
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))

  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}
