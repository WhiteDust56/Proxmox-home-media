module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve3"
  vm_id            = 111
  hostname         = "immich.homeserver.lan"
  ipv4_address     = "dhcp"
  cpu_cores        = 2
  memory_dedicated = 1500
  memory_swap      = 1000
  disk_size        = 8
  mac_address      = "BC:24:11:58:BE:17"
}

import {
  id = "pve3/111"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_111
  to   = module.lxc.proxmox_virtual_environment_container.this
}
