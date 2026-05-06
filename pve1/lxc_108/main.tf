module "lxc" {
  source = "../../modules/lxc"

  node_name        = "pve1"
  vm_id            = 108
  hostname         = "ansible.homeserver.lan"
  ipv4_address     = "192.168.1.5/24"
  ipv4_gateway     = "192.168.1.1"
  cpu_cores        = 2
  memory_dedicated = 1000
  memory_swap      = 512
  disk_size        = 40
  mac_address      = "BC:24:11:58:8D:4F"
}

import {
  id = "pve1/108"
  to = module.lxc.proxmox_virtual_environment_container.this
}

moved {
  from = proxmox_virtual_environment_container.lxc_108
  to   = module.lxc.proxmox_virtual_environment_container.this
}
