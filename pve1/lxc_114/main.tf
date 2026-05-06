module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve1"
  vm_id            = 114
  hostname         = "jellyseer.homeserver.lan"
  ipv4_address     = "192.168.1.8/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:E9:01:78"
}

import {
  id = "pve1/114"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_114
  to   = module.lxc.proxmox_virtual_environment_container.this
}
