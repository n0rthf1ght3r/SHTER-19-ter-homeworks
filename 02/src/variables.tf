variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "<your_ssh_ed25519_key>"
#   description = "ssh-keygen -t ed25519"
# }

# variable "service_account_key_file" {
#   type        = string
#   description = "Path to SA JSON key"
# }

variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "CIDR for ru-central1-b"
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family"
}

# variable "vms_ssh_public_root_key" {
#   type        = string
#   description = "Public SSH key line"
# }

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  # Defaults matching a typical setup (adjust in terraform.tfvars if needed)
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
  description = "CPU/memory/core_fraction settings for web and db VMs"
}

variable "vms_metadata" {
  type        = map(string)
  description = "Common metadata for all VMs (e.g., serial-port-enable, ssh-keys)"
}
