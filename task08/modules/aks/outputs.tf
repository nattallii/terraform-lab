output "host" {
  description = "Kubernetes API server host"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].host
  sensitive   = true
}

output "client_certificate" {
  description = "Client certificate used to authenticate to the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Client key used to authenticate to the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate used to authenticate to the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].cluster_ca_certificate
  sensitive   = true
}

output "key_vault_identity_client_id" {
  description = "Client ID of the managed identity used by the Key Vault Secrets Provider"
  value       = azurerm_kubernetes_cluster.aks_cluster.key_vault_secrets_provider[0].secret_identity[0].client_id
}

