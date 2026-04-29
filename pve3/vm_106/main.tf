resource "proxmox_virtual_environment_vm" "vm_106" {
  node_name = "pve3"
  vm_id     = 106
  name      = "ubuntu-desktop"
  memory {
    dedicated = 8000
  }
  cpu {
    cores   = 8
    sockets = 1
    type    = "x86-64-v2-AES"
  }
  operating_system {
    type = "l26"
  }
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 32
  }
  network_device {
    model = "virtio"
    mac_address = "BC:24:11:CF:CC:0B"
    bridge = "vmbr0"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve3/106"
  to = proxmox_virtual_environment_vm.vm_106
}
