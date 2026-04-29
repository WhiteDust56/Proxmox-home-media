resource "proxmox_virtual_environment_container" "lxc_124" {
  node_name = "pv2"
  vm_id     = 124
  initialization {
    hostname = "audiobookshelf.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.18/24"
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
  mount_point {
    volume = "/mnt/sdc1/boeken"
    path   = "/books"
  }
  mount_point {
    volume = "/mnt/sdc1/comics"
    path   = "/comics"
  }
  disk {
    datastore_id = "local-lvm"
    size = 8
  }
  network_interface {
    name = "eth0"
    mac_address = "BC:24:11:D4:22:2F"
  }
  unprivileged = true
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pv2/124"
  to = proxmox_virtual_environment_container.lxc_124
}
