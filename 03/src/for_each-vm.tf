# Образ Ubuntu (один на все ВМ)
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}
locals {
  # ожидается var.each_vm = [
  #   { vm_name = "main",    cpu = 2, ram = 2,  disk_volume = 20 },
  #   { vm_name = "replica", cpu = 4, ram = 4,  disk_volume = 40 },
  # ]
  each_vm_map = { for vm in var.each_vm : vm.vm_name => vm }

  # Путь к ключу и сам ключ
  ssh_public_key = file(pathexpand(var.ssh_public_key_path))
}

# Две БД-ВМ с разными параметрами
resource "yandex_compute_instance" "db" {
  for_each = local.each_vm_map
  name     = "db-${each.key}"

  platform_id = "standard-v3"

  resources {
    cores  = each.value.cpu
    memory = each.value.ram # Гб
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = each.value.disk_volume # Гб
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.develop.id]
    nat                = true
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}
