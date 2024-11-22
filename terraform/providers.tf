# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
provider "azuredevops" {
  org_service_url = var.tf_AzDO_ORGANIZATION
  personal_access_token = var.tf_PAT
}
provider "kubernetes" {
  host                   = module.acr_attach_aks.aks_api_server_url
  client_certificate     = base64decode(module.acr_attach_aks.aks_client_certificate)
  client_key             = base64decode(module.acr_attach_aks.aks_client_key)
  cluster_ca_certificate = base64decode(module.acr_attach_aks.aks_ca_certificate)
}