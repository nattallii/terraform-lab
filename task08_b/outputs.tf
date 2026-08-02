output "aca_fqdn" {
  description = "FQDN of the application deployed to Azure Container App"
  value       = module.aca.aca_fqdn
}

output "aks_lb_ip" {
  description = "Load Balancer public IP address of the application deployed to AKS"
  value       = module.k8s.aks_lb_ip
}

output "redis_fqdn" {
  description = "FQDN of redis"
  value       = module.aci_redis.redis_fqdn
}