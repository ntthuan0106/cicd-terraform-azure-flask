output "aks_api_server_url" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  sensitive = true
  description = "The API server URL of the AKS cluster"
}
output "rg_name" {
  value = azurerm_resource_group.aks_rg.name
}
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks-cluster.name
}
