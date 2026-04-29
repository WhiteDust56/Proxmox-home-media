resource "proxmox_virtual_environment_vm" "vm_100" {
  node_name = "pve1"
  vm_id     = 100
  name      = "llmtdarr.homeserver.lan"
  memory {
    dedicated = 10000
  }
  cpu {
    cores   = 6
    sockets = 1
    type    = "x86-64-v2-AES"
  }
  operating_system {
    type = "l26"
  }
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 170
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
    mac_address = "BC:24:11:30:CE:65"
    bridge = "vmbr0"
  }
  lifecycle {
    prevent_destroy = true
  }
}

import {
  id = "pve1/100"
  to = proxmox_virtual_environment_vm.vm_100
}
