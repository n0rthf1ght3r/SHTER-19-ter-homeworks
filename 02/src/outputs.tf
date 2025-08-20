output "vms" {
  description = "Instance name, external IP и FQDN по каждой ВМ"
  value = {
    for vm in [
      yandex_compute_instance.platform,
      yandex_compute_instance.db
      ] : vm.name => {
      instance_name = vm.name
      external_ip   = vm.network_interface[0].nat_ip_address
      fqdn          = vm.fqdn
    }
  }
}
