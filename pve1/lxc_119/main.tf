module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve1"
  vm_id            = 119
  hostname         = "homepage.homeserver.lan"
  ipv4_address     = "192.168.1.4/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 512
  memory_swap      = 512
  disk_size        = 8
  mac_address      = "BC:24:11:80:47:D6"
}

import {
  id = "pve1/119"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_119
  to   = module.lxc.proxmox_virtual_environment_container.this
}
