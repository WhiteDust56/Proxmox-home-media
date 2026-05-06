module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 124
  hostname         = "audiobookshelf.homeserver.lan"
  ipv4_address     = "192.168.1.18/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:D4:22:2F"
}

import {
  id = "pv2/124"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_124
  to   = module.lxc.proxmox_virtual_environment_container.this
}
