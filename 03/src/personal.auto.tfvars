token     = "y0__xDSk-4kGMHdEyD6wuGTFC3YB1AoBGrRqK96c_vugFVNISba"
cloud_id  = "b1g3qbsgri9ct1gdgpmt"
folder_id = "b1g7j9h6bjkteg3c776l"

each_vm = [
  { vm_name = "main", cpu = 2, ram = 2, disk_volume = 20 },
  { vm_name = "replica", cpu = 4, ram = 4, disk_volume = 40 },
]
ssh_public_key_path = "C:/Users/KEA/.ssh/id_ed25519.pub"