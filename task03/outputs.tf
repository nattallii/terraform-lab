output "rg_id" {
  description = "ID of the resource group"
  value       = azurerm_resource_group.rg.id
}

output "vnet_id" {
  description = "ID of virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "sa_blob_endpoint" {
  description = "The primary endpoint URL for blob storage"
  value       = azurerm_storage_account.storage.primary_blob_endpoint


}