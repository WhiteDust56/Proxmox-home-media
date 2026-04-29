resource "proxmox_virtual_environment_vm" "vm_101" {
  node_name = "pve1"
  vm_id     = 101
  name      = "mediadockerstack.homeserver.lan"
  memory {
    dedicated = 2000
  }
  cpu {
    cores   = 3
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
    size         = 120
  }
  disk {
    # Note: Passed-through disks require custom mappings or manual state linking.
    # passthrough = "/dev/sda1"
    interface    = "scsi1"
    size         = 1863
  }
  disk {
    # Note: Passed-through disks require custom mappings or manual state linking.
    # passthrough = "/dev/sdc1"
    interface    = "scsi2"
    size         = 1862
  }
  network_device {
    model = "virtio"
    mac_address = "BC:24:11:AD:F4:05"
    bridge = "vmbr0"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve1/101"
  to = proxmox_virtual_environment_vm.vm_101
}
