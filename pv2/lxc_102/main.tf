module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pv2"
  vm_id            = 102
  hostname         = "pihole.homeserver.lan"
  ipv4_address     = "192.168.1.241/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 1
  memory_dedicated = 1000
  memory_swap      = 512
  disk_size        = 4
  mac_address      = "BC:24:11:AE:FC:C4"
}

import {
  id = "pv2/102"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_102
  to   = module.lxc.proxmox_virtual_environment_container.this
}
