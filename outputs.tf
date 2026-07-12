output "managed_redises_customer_managed_key" {
  description = "Map of customer_managed_key values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.customer_managed_key }
}
output "managed_redises_default_database" {
  description = "Map of default_database values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.default_database }
  sensitive   = true
}
output "managed_redises_high_availability_enabled" {
  description = "Map of high_availability_enabled values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.high_availability_enabled }
}
output "managed_redises_hostname" {
  description = "Map of hostname values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.hostname }
}
output "managed_redises_identity" {
  description = "Map of identity values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.identity }
}
output "managed_redises_location" {
  description = "Map of location values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.location }
}
output "managed_redises_name" {
  description = "Map of name values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.name }
}
output "managed_redises_public_network_access" {
  description = "Map of public_network_access values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.public_network_access }
}
output "managed_redises_resource_group_name" {
  description = "Map of resource_group_name values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.resource_group_name }
}
output "managed_redises_sku_name" {
  description = "Map of sku_name values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.sku_name }
}
output "managed_redises_tags" {
  description = "Map of tags values across all managed_redises, keyed the same as var.managed_redises"
  value       = { for k, v in azurerm_managed_redis.managed_redises : k => v.tags }
}

