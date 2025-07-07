variable "subnet_name" {
  description = "The name of the subnet."
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = any
}

variable "rg_name" {
  description = "The name of the resource group."
}

variable "vnet_name" {
  description = "The name of the virtual network."
}