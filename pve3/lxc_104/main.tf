module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve3"
  vm_id            = 104
  hostname         = "tdarr-node.homeserver.lan"
  ipv4_address     = "192.168.1.3/32"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 6
  memory_dedicated = 3000
  memory_swap      = 1000
  disk_size        = 50
  mac_address      = "BC:24:11:2C:C2:C1"
}

import {
  id = "pve3/104"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_104
  to   = module.lxc.proxmox_virtual_environment_container.this
}
