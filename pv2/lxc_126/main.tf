module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 126
  hostname         = "qbittorent.homeserver.lan"
  ipv4_address     = "192.168.1.20/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:7B:5D:DD"
}

import {
  id = "pv2/126"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_126
  to   = module.lxc.proxmox_virtual_environment_container.this
}
