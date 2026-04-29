resource "proxmox_virtual_environment_container" "lxc_111" {
  node_name = "pve3"
  vm_id     = 111
  initialization {
    hostname = "immich.homeserver.lan"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
  cpu {
    cores = 2
  }
  memory {
    dedicated = 1500
    swap = 1000
  }
  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Note: exact template might differ in proxmox
    type = "ubuntu"
  }
  mount_point {
    volume = "/mnt/sda2"
    path   = "/mnt/data"
  }
  disk {
    datastore_id = "local-lvm"
    size = 8
  }
  network_interface {
    name = "eth0"
    mac_address = "BC:24:11:58:BE:17"
  }
  unprivileged = true
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve3/111"
  to = proxmox_virtual_environment_container.lxc_111
}
