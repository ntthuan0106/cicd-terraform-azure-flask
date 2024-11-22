variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
variable "client_id" {
  description = "Azure Client ID"
  type        = string
}
variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
}
variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}
variable "git_personal_access_token" {
  description = "git personal access token"
  type = string
}
variable "NGROK_API_KEY" {
  description = "NGROK API key"
  type = string
}
variable "NGROK_TOKEN" {
  description = "NGROK API token"
  type = string
}
variable "tf_AzDO_ORGANIZATION" {
  type = string
  description = "Azure devops organization"
}
variable "tf_PAT" {
  type = string
  description = "Azure devops personal access token"
}