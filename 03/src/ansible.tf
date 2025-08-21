variable "ansible_user" {
  type        = string
  default     = "ubuntu"
  description = "Ansible SSH user"
}

variable "ansible_private_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "Path to SSH private key for Ansible"
}

locals {
  web_hosts = [
    for inst in yandex_compute_instance.web : {
      name = inst.name
      ip   = inst.network_interface[0].nat_ip_address
      fqdn = inst.fqdn
    }
  ]

  db_hosts = [
    for _, inst in yandex_compute_instance.db : {
      name = inst.name
      ip   = inst.network_interface[0].nat_ip_address
      fqdn = inst.fqdn
    }
  ]

  storage_host = {
    name = yandex_compute_instance.storage.name
    ip   = yandex_compute_instance.storage.network_interface[0].nat_ip_address
    fqdn = yandex_compute_instance.storage.fqdn
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"

  content = templatefile(
    "${path.module}/inventory.tftpl",
    {
      web                      = local.web_hosts
      db                       = local.db_hosts
      storage                  = local.storage_host
      ansible_user             = var.ansible_user
      ansible_private_key_path = pathexpand(var.ansible_private_key_path)
    }
  )

  depends_on = [
    yandex_compute_instance.db,
    yandex_compute_instance.web,
    yandex_compute_instance.storage
  ]
}

output "ansible_inventory_path" {
  value = local_file.ansible_inventory.filename
}
