resource "kubernetes_namespace" "aks_namespace" {
  metadata {
    name = var.aks_namespace
  }
}