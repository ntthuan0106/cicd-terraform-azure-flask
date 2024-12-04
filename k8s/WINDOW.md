# Ingress to apps deployed on Azure Kubernetes Service (AKS) while using Window
## Prerequisites
- Azure CLI
- Kubectl
- Helm v3.16.2
- Docker engine
- AKS cluster
## Build and push Docker image to ACR
```bash
az login
az acr login -n acrthuantest
docker build --pull --rm -f "web-app\Dockerfile" -t acrthuantest.azurecr.io/app:v1 "web-app"
docker push acrthuantest.azurecr.io/app:v1
```
## Install the ngrok Kubernetes Operator
1. Create an ngrok static subdomain for ingress if you don't have one already.
2. Add the ngrok Helm repository if you haven't already.
```bash
helm repo add ngrok https://charts.ngrok.com
```
3. Config Ngrok values for ngrok-ingress-controller 
```bash
# values.yaml
credentials:
  apiKey: {Your Ngrok API Key}
  authtoken: {Your Ngrok Auth Token}

tunnel:
  name: store-tunnel
  region: us
  subdomain: {Your Ngrok subdomain}
  addr: {Your Ngrok port}
```
4. Login to AKS
```bash
az aks get-credentials --resource-group Cluster --name cluster
```
5. Install the ngrok Kubernetes Operator with Helm
```bash
helm install ngrok-ingress-controller ngrok/kubernetes-ingress-controller `
  --namespace test `
  --set credentials.apiKey=$(NGROK_API_KEY) `
  --set credentials.authtoken=$(NGROK_AUTH_TOKEN)
```
6. Encode client secret to base64 encode in powershell
```bash
a String to Base64 in PowerShell
# Define your plain text secret
$plainText = $CLIENT_SECRET

# Convert the plain text to a Base64 string
$BASE64_ENC_CLIENT_SECRET = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($plainText))

# Output the Base64 encoded string
Write-Output $BASE64_ENC_CLIENT_SECRET
```
## Deploy web app to aks
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```
