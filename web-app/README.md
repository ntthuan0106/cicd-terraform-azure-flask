## Build and push the Dockerimage to ACR
Build and push the Dockerimage to ACR
```bash
az login
az acr login -n ${ACR_NAME}
docker build --pull --rm -f "web-app\Dockerfile" -t acrthuantest.azurecr.io/app:v1 "web-app"
docker push acrthuantest.azurecr.io/app:v1
```
