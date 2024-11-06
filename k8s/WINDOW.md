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
  --create-namespace `
  -f values.yaml
```
## Deploy web app to aks
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```
