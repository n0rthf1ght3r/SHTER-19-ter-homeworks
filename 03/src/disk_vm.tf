
resource "yandex_compute_disk" "data_disks" {
  count = 3

  name = "data-disk-${count.index + 1}"
  size = 1
  type = "network-hdd"
  zone = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 10
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.develop.id]
    nat                = true
  }

  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.data_disks[*].id)
    content {
      disk_id = secondary_disk.value
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}
