resource "proxmox_virtual_environment_container" "lxc_127" {
  node_name = "pve3"
  vm_id     = 127
  initialization {
    hostname = "dagboek.homeserver.lan"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
  cpu {
    cores = 1
  }
  memory {
    dedicated = 512
    swap = 512
  }
  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Note: exact template might differ in proxmox
    type = "ubuntu"
  }
  disk {
    datastore_id = "local-lvm"
    size = 8
  }
  network_interface {
    name = "eth0"
    mac_address = "BC:24:11:F4:45:D0"
  }
  unprivileged = true
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve3/127"
  to = proxmox_virtual_environment_container.lxc_127
}
