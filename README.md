# terraform-azurerm-appserviceplan

[![Terraform](https://github.com/imjoseangel/terraform-azurerm-appserviceplan/actions/workflows/terraform.yml/badge.svg)](https://github.com/imjoseangel/terraform-azurerm-appserviceplan/actions/workflows/terraform.yml)

## Deploys an Azure Application Service Plan

This Terraform module deploys an Application Service Plan on Azure

### NOTES

* A Basic SKU Tier is created by default.

## Usage in Terraform 1.0

```terraform
module "appserviceplan" {
  source                = "github.com/imjoseangel/terraform-azurerm-appserviceplan"
  name                  = var.appsp_name
  resource_group_name   = var.appsp_rsg
  location              = var.location
  create_resource_group = true
}
```

## Authors

Originally created by [imjoseangel](http://github.com/imjoseangel)

## License

[MIT](LICENSE)
