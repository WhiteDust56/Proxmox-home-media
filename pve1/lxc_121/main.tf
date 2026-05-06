module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve1"
  vm_id            = 121
  hostname         = "nzbhydra.homeserver.lan"
  ipv4_address     = "192.168.1.13/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:72:C1:F6"
}

import {
  id = "pve1/121"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_121
  to   = module.lxc.proxmox_virtual_environment_container.this
}
