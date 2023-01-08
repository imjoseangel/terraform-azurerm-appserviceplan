#-------------------------------
# Local Declarations
#-------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp[*].name, azurerm_resource_group.rg[*].name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp[*].location, azurerm_resource_group.rg[*].location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#---------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  #ts:skip=AC_AZURE_0389 RSG lock should be skipped for now.
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

#---------------------------------------------------------
# App Service Plan Creation or selection
#---------------------------------------------------------

resource "azurerm_service_plan" "main" {
  name                = format("%s-%s", var.prefix, lower(replace(var.name, "/[[:^alnum:]]/", "")))
  location            = local.location
  resource_group_name = local.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name


  tags = merge({ "ResourceName" = format("%s-%s", var.prefix, lower(replace(var.name, "/[[:^alnum:]]/", ""))) }, var.tags, )

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
