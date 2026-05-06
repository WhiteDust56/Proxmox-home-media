module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve3"
  vm_id            = 117
  hostname         = "llm1.homeserver.lan"
  ipv4_address     = "dhcp"
  cpu_cores        = 1
  memory_dedicated = 2000
  memory_swap      = 1000
  disk_size        = 8
  mac_address      = "BC:24:11:33:88:93"
}

import {
  id = "pve3/117"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_117
  to   = module.lxc.proxmox_virtual_environment_container.this
}
