output "endpoint_hostname" {
  description = "Hostname of the Azure Front Door endpoint."
  value       = module.cdn.endpoint_hostname
}