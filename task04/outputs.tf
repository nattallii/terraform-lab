output "vm_public_ip" {
  description = "Public IP of VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "vm_fqdn" {
  description = "The Fully Qualified Domain Name of the Virtual Machine"
  value       = azurerm_public_ip.pip.fqdn

}
