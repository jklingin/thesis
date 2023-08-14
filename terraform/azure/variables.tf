variable "prefix" {
  type        = string
  description = "A prefix to use with resources."
  default     = "centralus"
}

variable "location" {
  type        = string
  description = "An Azure location."
  default     = "centralus"
}

variable "vm_image" {
  type        = map(string)
  description = "The virtual machine source image information"
  default     = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18_04-lts-gen2"
    version   = "18.04.202112020"
  }
}

variable "vm_size" {
  type        = string
  description = "The virtual machine size."
  default     = "Standard_NC6s_v3"
}

variable "os_disk_size_gb" {
  type        = number
  description = "OS disk size in GB."
  default     = 300
}

variable "os_disk_storage_type" {
  type        = string
  description = "OS disk storage type."
  default     = "StandardSSD_LRS"
}
