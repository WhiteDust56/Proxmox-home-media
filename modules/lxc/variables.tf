variable "node_name" { type = string }
variable "vm_id" { type = number }
variable "hostname" { type = string }
variable "ipv4_address" { type = string }
variable "ipv4_gateway" {
  type    = string
  default = null
}
variable "cpu_cores" { type = number }
variable "memory_dedicated" { type = number }
variable "memory_swap" {
  type    = number
  default = 512
}
variable "disk_size" { type = number }
variable "mac_address" { type = string }
