terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "1.4.0"
    }
  }
}
resource "azuredevops_project" "project" {
  name               = var.project_name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Basic"
}
resource "azuredevops_serviceendpoint_github" "github_svc_connection" {
  project_id            = azuredevops_project.project.id
  service_endpoint_name = "ntthuan0106"
  # Note Github Apps do not support a description and will always be empty string. Must be explicitly set to override the default value.  
  description = "Managed by Terraform"
  auth_personal {
    personal_access_token = var.git_personal_access_token
  }
}
resource "azuredevops_serviceendpoint_azurecr" "example" {
  project_id                = azuredevops_project.project.id
  service_endpoint_name     = var.acr_svc_endpoint_name
  resource_group            = var.acr_resource_group_name
  azurecr_spn_tenantid      = var.azure_tenant_id
  azurecr_name              = var.acr_target_name
  azurecr_subscription_id   = var.azure_subscription_id
  azurecr_subscription_name = var.azure_subscription_name
}
resource "azuredevops_serviceendpoint_kubernetes" "az_aks" {
  project_id            = azuredevops_project.project.id
  service_endpoint_name = var.azdo_svc_ep_k8s_name
  apiserver_url         = var.k8s_api_server_url
  authorization_type    = "AzureSubscription"

  azure_subscription {
    subscription_id   = var.azure_subscription_id
    subscription_name = var.azure_subscription_name
    tenant_id         = var.azure_tenant_id
    resourcegroup_id  = var.aks_resource_group_name
    cluster_name      = var.aks_cluster_name
    namespace = var.cluster_namespace_name
    cluster_admin = true
  }
}
resource "azuredevops_variable_group" "NGROK" {
  project_id   = azuredevops_project.project.id
  name         = "NGROK"
  description  = "NGROK variables"
  allow_access = true

  variable {
    name = "NGROK_API_KEY"
    secret_value = var.NGROK_API_KEY
    is_secret = true
  }
  variable {
    name = "NGROK_TOKEN"
    secret_value = var.NGROK_TOKEN
    is_secret = true
  }
  variable {
    name = "NGROK_CLIENT_ID"
    secret_value = var.NGROK_CLIENT_ID
    is_secret = true
  }
  variable {
    name = "NGROK_CLIENT_SECRET"
    secret_value = var.NGROK_CLIENT_SECRET
    is_secret = true
  }
}
resource "azuredevops_variable_group" "AZURE_CREDENTIALS" {
  project_id   = azuredevops_project.project.id
  name         = "AZURE_CREDENTIALS"
  description  = "Azure CREDENTIALs"
  allow_access = true
  variable {
    name = "AZURE_SUBSCRIPTION_ID"
    secret_value = var.azure_subscription_id
    is_secret = true
  }

  variable {
    name = "AZURE_TENANT_ID"
    secret_value = var.azure_tenant_id
    is_secret = true
  }
  variable {
    name = "AZURE_CLIENT_ID"
    secret_value = var.azure_client_id
    is_secret = true
  }
  variable {
    name = "AZURE_CLIENT_SECRET"
    secret_value = var.azure_client_secret
    is_secret = true
  }
}
