module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve3"
  vm_id            = 127
  hostname         = "dagboek.homeserver.lan"
  ipv4_address     = "dhcp"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:F4:45:D0"
}

import {
  id = "pve3/127"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_127
  to   = module.lxc.proxmox_virtual_environment_container.this
}
