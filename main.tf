#-------------------------------
# Local Declarations
#-------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

data "azurerm_client_config" "current" {}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#---------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  #ts:skip=accurics.azure.NS.272 RSG lock should be skipped for now.
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

#---------------------------------------------------------
# App Service Plan Creation or selection
#---------------------------------------------------------

resource "azurerm_app_service_plan" "main" {
  name                = format("%s-%s", var.prefix, lower(replace(var.name, "/[[:^alnum:]]/", "")))
  location            = local.location
  resource_group_name = local.resource_group_name
  kind                = var.kind
  reserved            = var.kind == "Windows" ? false : (var.kind == "Linux" ? true : var.reserved)

  sku {
    tier = var.tier
    size = var.size
  }

  tags = merge({ "ResourceName" = format("%s-%s", var.prefix, lower(replace(var.name, "/[[:^alnum:]]/", ""))) }, var.tags, )
}
