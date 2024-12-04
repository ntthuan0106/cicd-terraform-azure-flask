module "acr_attach_aks" {
  source = "./modules/AKS-ACR"
  rg_name = "Cluster"
  acr_name = "ACRthuantest"
  k8s_cluster_name = "cluster"
}

module "AzDO_project" {
  source = "./modules/AzDevOps"
  project_name = "DACN"

  acr_svc_endpoint_name = "ACRthuantest"
  acr_resource_group_name = module.acr_attach_aks.rg_name
  acr_target_name = module.acr_attach_aks.acr_name

  azdo_svc_ep_k8s_name = "AKSthuantest"
  aks_cluster_name = module.acr_attach_aks.aks_cluster_name
  aks_resource_group_name = module.acr_attach_aks.rg_name
  k8s_api_server_url = module.acr_attach_aks.aks_api_server_url
  cluster_namespace_name = module.k8s_cluster.aks_namespace_name

  azure_client_id = var.client_id
  azure_client_secret = var.client_secret
  azure_tenant_id = var.tenant_id
  azure_subscription_id = var.subscription_id
  azure_subscription_name = "Azure Subscription 1"

  NGROK_API_KEY = var.NGROK_API_KEY
  NGROK_TOKEN = var.NGROK_TOKEN
  NGROK_CLIENT_ID = var.NGROK_CLIENT_ID
  NGROK_CLIENT_SECRET = var.NGROK_CLIENT_SECRET

  git_personal_access_token = var.git_personal_access_token
}
module "k8s_cluster" {
  source = "./modules/k8s"
  aks_namespace = "test"
}