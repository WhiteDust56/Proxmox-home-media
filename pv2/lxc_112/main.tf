module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 112
  hostname         = "tdarrserver.homeserver.lan"
  ipv4_address     = "192.168.1.2/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 5
  memory_dedicated = 6000
  memory_swap      = 3000
  disk_size        = 20
  mac_address      = "BC:24:11:93:D8:63"
}

import {
  id = "pv2/112"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_112
  to   = module.lxc.proxmox_virtual_environment_container.this
}
