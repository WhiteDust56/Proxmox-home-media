module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 109
  hostname         = "plexeinternal.homeserver.lan"
  ipv4_address     = "192.168.1.101/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 4
  memory_dedicated = 4000
  memory_swap      = 1000
  disk_size        = 20
  mac_address      = "BC:24:11:6E:33:24"
}

import {
  id = "pv2/109"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_109
  to   = module.lxc.proxmox_virtual_environment_container.this
}
