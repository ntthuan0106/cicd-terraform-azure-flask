module "acr_attach_aks" {
  source = "./modules/AKS-ACR"
  rg_name = "Cluster"
  acr_name = "ACRthuantest"
  k8s_cluster_name = "cluster"
}
