output "app_service_plan_id" {
  description = "Id of the created App Service Plan"
  value       = azurerm_app_service_plan.main.id
}

output "app_service_plan_name" {
  description = "Name of the created App Service Plan"
  value       = azurerm_app_service_plan.main.name
}

output "app_service_plan_location" {
  description = "Azure location of the created App Service Plan"
  value       = azurerm_app_service_plan.main.location
}

output "app_service_plan_max_workers" {
  description = "Maximum number of workers for the created App Service Plan"
  value       = azurerm_app_service_plan.main.maximum_number_of_workers
}
