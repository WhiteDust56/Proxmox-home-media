module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve1"
  vm_id            = 120
  hostname         = "sabnzbd.homeserver.lan"
  ipv4_address     = "192.168.1.9/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 1000
  memory_swap      = 1000
  disk_size        = 8
  mac_address      = "BC:24:11:D3:DE:E5"
}

import {
  id = "pve1/120"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_120
  to   = module.lxc.proxmox_virtual_environment_container.this
}
