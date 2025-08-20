cloud_id                 = "b1g3qbsgri9ct1gdgpmt"
folder_id                = "b1g7j9h6bjkteg3c776l"
service_account_key_file = "authorized_key.json"
vms_ssh_public_root_key  = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJpYbwJI0AnKlZhwxWipXErfFk1LDxmXMpMIgoscd4r2 webinar"

vms_resources = {
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

vms_metadata = {
  "serial-port-enable" = "1"
  "ssh-keys"           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJpYbwJI0AnKlZhwxWipXErfFk1LDxmXMpMIgoscd4r2 webinar"
}
