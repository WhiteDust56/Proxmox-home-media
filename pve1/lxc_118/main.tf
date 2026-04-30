resource "proxmox_virtual_environment_container" "lxc_118" {
  node_name    = "pve1"
  vm_id        = 118
  unprivileged = true
  initialization {
    hostname = "ttraefik.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.242/24"
        gateway = "192.168.1.1"
      }
    }
  }
  cpu {
    cores = 1
  }
  memory {
    dedicated = 512
    swap      = 512
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
    mac_address = "BC:24:11:A0:2F:78"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve1/118"
  to = proxmox_virtual_environment_container.lxc_118
}
