output "azure_firewall_public_ip" {
  description = "Firewall public ip"
  value       = module.afw.azure_firewall_public_ip
}

output "azure_firewall_private_ip" {
  description = "Firewall private ip"
  value       = module.afw.azure_firewall_public_ip
}