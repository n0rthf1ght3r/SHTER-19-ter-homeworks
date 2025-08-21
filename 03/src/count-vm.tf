# Две одинаковые web-ВМ: web-1 и web-2
resource "yandex_compute_instance" "web" {
  count = 2
  name  = "web-${count.index + 1}" # web-1, web-2

  # Явная зависимость: web после db (из файла for_each-vm.tf)
  depends_on = [yandex_compute_instance.db]

  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2 # Гб
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 20 # Гб
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
