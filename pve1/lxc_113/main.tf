module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve1"
  vm_id            = 113
  hostname         = "prowlarr.homeserver.lan"
  ipv4_address     = "192.168.1.10/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:86:1E:C9"
}

import {
  id = "pve1/113"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_113
  to   = module.lxc.proxmox_virtual_environment_container.this
}
