resource "proxmox_virtual_environment_container" "lxc_117" {
  node_name    = "pve3"
  vm_id        = 117
  unprivileged = true

  initialization {
    hostname = "llm1.homeserver.lan"
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
    dedicated = 2000
    swap      = 1000
  }
  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Note: exact template might differ in proxmox
    type             = "ubuntu"
  }
  disk {
    datastore_id = "local-lvm"
    size         = 8
  }
  network_interface {
    name        = "eth0"
    mac_address = "BC:24:11:33:88:93"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve3/117"
  to = proxmox_virtual_environment_container.lxc_117
}
