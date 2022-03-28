output "id" {
  description = "Id of the created App Service Plan"
  value       = azurerm_service_plan.main.id
}

output "name" {
  description = "Name of the created App Service Plan"
  value       = azurerm_service_plan.main.name
}

output "location" {
  description = "Azure location of the created App Service Plan"
  value       = azurerm_service_plan.main.location
}
