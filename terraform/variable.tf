variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-terraform-devops"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "UK South"
}

variable "vnet_name" {
  description = "name of the Virtual network"
  type        = string
  default     = "vnet_terraform_devops"
}

variable "vnet_address_space" {
  description = "adress space for Virtul network"
  type        = string
  default     = "10.0.0.0/16"
}
