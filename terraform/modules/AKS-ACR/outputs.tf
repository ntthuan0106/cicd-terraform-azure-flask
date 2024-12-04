output "aks_api_server_url" {
  value     = azurerm_kubernetes_cluster.aks-cluster.kube_config.0.host
  sensitive = true
  description = "The API server URL of the AKS cluster"
}
output "aks_client_certificate" {
  value = azurerm_kubernetes_cluster.aks-cluster.kube_config.0.client_certificate
  sensitive = true
  description = "aks client certificate"
}
output "aks_client_key" {
  value = azurerm_kubernetes_cluster.aks-cluster.kube_config.0.client_key
  sensitive = true
  description = "aks client key"
}
output "aks_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks-cluster.kube_config.0.cluster_ca_certificate
  sensitive = true
  description = "aks cluster ca certificate"
}
output "rg_name" {
  value = azurerm_resource_group.aks_rg.name
}
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks-cluster.name
}
output "acr_name" {
  value = azurerm_container_registry.acr.name
}
