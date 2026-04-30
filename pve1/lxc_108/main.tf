resource "proxmox_virtual_environment_container" "lxc_108" {
  node_name = "pve1"
  vm_id     = 108
  initialization {
    hostname = "ansible.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.5/24"
        gateway = "192.168.1.1"
      }
    }
  }
  cpu {
    cores = 2
  }
  memory {
    dedicated = 1000
    swap      = 512
  }
  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Note: exact template might differ in proxmox
    type             = "ubuntu"
  }
  disk {
    datastore_id = "local-lvm"
    size         = 40
  }
  network_interface {
    name        = "eth0"
    mac_address = "BC:24:11:58:8D:4F"
  }
  unprivileged = true
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve1/108"
  to = proxmox_virtual_environment_container.lxc_108
}
