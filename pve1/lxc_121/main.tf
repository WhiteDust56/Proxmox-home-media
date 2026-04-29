resource "proxmox_virtual_environment_container" "lxc_121" {
  node_name = "pve1"
  vm_id     = 121
  initialization {
    hostname = "nzbhydra.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.13/24"
        gateway = "192.168.1.1"
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
    mac_address = "BC:24:11:72:C1:F6"
  }
  unprivileged = true
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve1/121"
  to = proxmox_virtual_environment_container.lxc_121
}
