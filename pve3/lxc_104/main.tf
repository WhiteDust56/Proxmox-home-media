resource "proxmox_virtual_environment_container" "lxc_104" {
  node_name    = "pve3"
  vm_id        = 104
  unprivileged = true

  initialization {
    hostname = "tdarr-node.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.3/32"
        gateway = "192.168.1.1"
      }
    }
  }
  cpu {
    cores = 6
  }
  memory {
    dedicated = 3000
    swap      = 1000
  }
  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Note: exact template might differ in proxmox
    type             = "ubuntu"
  }
  mount_point {
    volume = "/mnt/sda1/content/films"
    path   = "/media1/content/films"
  }
  mount_point {
    volume = "/mnt/sda1/content/series"
    path   = "/media1/content/series"
  }
  mount_point {
    volume = "/mnt/sdc1/Films"
    path   = "/media2/Films"
  }
  mount_point {
    volume = "/mnt/sdc1/series"
    path   = "/media2/series"
  }
  mount_point {
    volume = "/mnt/sda1/content/transcode_temp"
    path   = "/temp1/"
  }
  disk {
    datastore_id = "local-lvm"
    size         = 50
  }
  network_interface {
    name        = "eth0"
    mac_address = "BC:24:11:2C:C2:C1"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve3/104"
  to = proxmox_virtual_environment_container.lxc_104
}
