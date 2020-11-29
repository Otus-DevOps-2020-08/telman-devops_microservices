variable instance_count {
  description = "count of instance"
  type        = number
  default     = 1
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "fd8odlihkbqfh78g1qgt"
}
variable "subnet_id" {
  description = "subnet"
}
variable "public_key_path" {
  description = "id_rsa pub"
}
