resource "proxmox_virtual_environment_vm" "vm_107" {
  node_name = "pv2"
  vm_id     = 107
  name      = "tailscale"
  memory {
    dedicated = 2000
  }
  cpu {
    cores   = 1
    sockets = 1
    type    = "x86-64-v2-AES"
  }
  operating_system {
    type = "l26"
  }
  disk {
    datastore_id = "local"
    interface    = "ide2"
    size         = 3
  }
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 32
  }
  network_device {
    model       = "virtio"
    mac_address = "BC:24:11:DD:4D:A9"
    bridge      = "vmbr0"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pv2/107"
  to = proxmox_virtual_environment_vm.vm_107
}
