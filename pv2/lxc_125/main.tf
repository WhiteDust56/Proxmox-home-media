resource "proxmox_virtual_environment_container" "lxc_125" {
  node_name = "pv2"
  vm_id     = 125
  initialization {
    hostname = "gitlab.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.19/24"
        gateway = "192.168.1.1"
      }
    }
  }
  cpu {
    cores = 4
  }
  memory {
    dedicated = 4000
    swap = 3000
  }
  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Note: exact template might differ in proxmox
    type = "ubuntu"
  }
  disk {
    datastore_id = "local-lvm"
    size = 16
  }
  network_interface {
    name = "eth0"
    mac_address = "BC:24:11:F2:14:99"
  }
  unprivileged = true
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pv2/125"
  to = proxmox_virtual_environment_container.lxc_125
}
