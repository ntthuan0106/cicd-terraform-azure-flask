output "aks_namespace_name" {
  value = kubernetes_namespace.aks_namespace.metadata.0.name
}