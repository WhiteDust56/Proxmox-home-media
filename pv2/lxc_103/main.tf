module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 103
  hostname         = "plex.homeserver.lan"
  ipv4_address     = "192.168.1.201/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 4000
  memory_swap      = 1000
  disk_size        = 50
  mac_address      = "BC:24:11:A4:95:A9"
}

import {
  id = "pv2/103"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_103
  to   = module.lxc.proxmox_virtual_environment_container.this
}
