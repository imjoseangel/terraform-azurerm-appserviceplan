variable "name" {
  description = "Name of Azure Kubernetes service."
}

variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = true
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "rg-demo-westeurope-01"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westeurope"
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
  type        = string
  default     = "default"
}

variable "kind" {
  description = "The kind of the App Service Plan to create. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service_plan.html#kind"
  type        = string
  default     = "Windows"
}

variable "reserved" {
  description = "Flag indicating if App Service Plan should be reserved. Forced to false if 'kind' is 'Windows' and to true if 'kind' is 'Linux'."
  type        = string
  default     = "false"
}

variable "tier" {
  description = "(Required) Specifies the plan's pricing tier."
  type        = string
  default     = "Basic"
}

variable "size" {
  description = "(Required) Specifies the plan's instance size."
  type        = string
  default     = "B1"
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
