module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 123
  hostname         = "ubooquity.homeserver.lan"
  ipv4_address     = "192.168.1.17/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:54:55:FE"
}

import {
  id = "pv2/123"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_123
  to   = module.lxc.proxmox_virtual_environment_container.this
}
