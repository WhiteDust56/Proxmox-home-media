resource "proxmox_virtual_environment_container" "lxc_105" {
  node_name = "pve1"
  vm_id     = 105
  initialization {
    hostname = "radarr.homeserver.lan"
    ip_config {
      ipv4 {
        address = "192.168.1.6/24"
        gateway = "192.168.1.1"
      }
    }
  }
  cpu {
    cores = 1
  }
  memory {
    dedicated = 1000
    swap      = 512
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
    volume = "/mnt/sda1/Downloads/Complete"
    path   = "/downloads/Complete"
  }
  disk {
    datastore_id = "local-lvm"
    size         = 8
  }
  network_interface {
    name        = "eth0"
    mac_address = "BC:24:11:9C:E6:CE"
  }
  unprivileged = true
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve1/105"
  to = proxmox_virtual_environment_container.lxc_105
}
