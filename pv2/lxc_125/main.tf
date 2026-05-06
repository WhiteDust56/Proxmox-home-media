module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 125
  hostname         = "gitlab.homeserver.lan"
  ipv4_address     = "192.168.1.19/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 4
  memory_dedicated = 4000
  memory_swap      = 3000
  disk_size        = 16
  mac_address      = "BC:24:11:F2:14:99"
}

import {
  id = "pv2/125"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_125
  to   = module.lxc.proxmox_virtual_environment_container.this
}
