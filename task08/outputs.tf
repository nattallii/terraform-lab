output "aci_fqdn" {
  description = "FQDN of the application deployed to Azure Container Instance"
  value       = module.aci.fqdn
}

output "aks_lb_ip" {
  description = "Load Balancer public IP address of the application deployed to AKS"
  value       = data.kubernetes_service_v1.app.status[0].load_balancer[0].ingress[0].ip
}