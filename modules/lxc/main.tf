terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.61.1"
    }
  }
}

resource "proxmox_virtual_environment_container" "this" {
  node_name = var.node_name
  vm_id     = var.vm_id

  initialization {
    hostname = var.hostname
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }
  }

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory_dedicated
    swap      = var.memory_swap
  }

  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    type             = "ubuntu"
  }

  disk {
    datastore_id = "local-lvm"
    size         = var.disk_size
  }

  network_interface {
    name        = "eth0"
    mac_address = var.mac_address
  }

  unprivileged = true

  lifecycle {
    prevent_destroy = true
  }
}
