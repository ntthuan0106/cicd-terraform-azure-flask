variable "project_name" {
  type = string
}
variable "git_personal_access_token" {
  type = string
  description = "github personal access token"
  sensitive = true
}
variable "acr_svc_endpoint_name" {
  description = "acr svc endpoint name"
  type = string
}
variable "acr_target_name" {
  description = "ACR target name"
  type = string
}
variable "acr_resource_group_name" {
  description = "resource group name"
  type = string
}
variable "azure_tenant_id" {
  type = string
  sensitive = true
  description = "azure tenant id"
}
variable "azure_subscription_id" {
  type = string
  sensitive = true
  description = "azure subscription id"
}

variable "azure_client_id" {
  type = string
  sensitive = true
  description = "azure client id"
}
variable "azure_client_secret" {
  type = string
  sensitive = true
  description = "azure client secret"
}
variable "azure_subscription_name" {
  type = string
  description = "name of subscription"
}
variable "azdo_svc_ep_k8s_name" {
  type = string
  description = "name of aks endpoint"
}
variable "k8s_api_server_url" {
  type = string
  description = "AKS server api url"
}
variable "aks_resource_group_name" {
  type = string
  description = "aks resource group name"
}
variable "aks_cluster_name" {
  type = string
  description = "aks cluster name"
}
variable "NGROK_API_KEY" {
  type = string
  sensitive = true
  description = "ngrok api key"
}
variable "NGROK_TOKEN" {
  type = string
  sensitive = true
  description = "ngrok token"
}