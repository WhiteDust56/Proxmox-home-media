resource "proxmox_virtual_environment_container" "lxc_112" {
  node_name    = "pv2"
  vm_id        = 112
  unprivileged = true

  initialization {
    hostname = "tdarrserver.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.2/24"
        gateway = "192.168.1.1"
      }
    }
  }
  cpu {
    cores = 5
  }
  memory {
    dedicated = 6000
    swap      = 3000
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
    size         = 20
  }
  network_interface {
    name        = "eth0"
    mac_address = "BC:24:11:93:D8:63"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pv2/112"
  to = proxmox_virtual_environment_container.lxc_112
}
